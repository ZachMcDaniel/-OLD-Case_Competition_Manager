using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.Web.ModelBinding;
using CaseCompetitionApp.Models;

namespace CaseCompetitionApp.Maintenance
{
    public partial class Default : System.Web.UI.Page
    {
        ApplicationUserManager userMgr;
        ApplicationRoleManager roleMgr;

        protected void Page_Load(object sender, EventArgs e)
        {
            userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            roleMgr = Context.GetOwinContext().Get<ApplicationRoleManager>();
        }

        // Select methods
        public IQueryable<ApplicationUser> grdUsers_GetData()
        {
            return userMgr.Users;
        }

        public object dvRoles_GetItem([Control] string grdRoles)
        {
            if (grdRoles == null) return new IdentityRole();
            return (from r in roleMgr.Roles
                    where r.Id == grdRoles
                    select r).SingleOrDefault();
        }

        // Update method
        public void dvRoles_UpdateItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                 where r.Id == Id
                                 select r).SingleOrDefault();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Update(role);
            if (result.Succeeded) Reload();
        }

        // Insert method
        public void dvRoles_InsertItem()
        {
            IdentityRole role = new IdentityRole();
            TryUpdateModel(role);
            IdentityResult result = roleMgr.Create(role);
            if (result.Succeeded) Reload();
        }

        // Delete method
        public void dvRoles_DeleteItem(string Id)
        {
            IdentityRole role = (from r in roleMgr.Roles
                                 where r.Id == Id
                                 select r).SingleOrDefault();
            IdentityResult result = roleMgr.Delete(role);
            if (result.Succeeded) Reload();
        }

        // Add roles to users
        protected void btnAddRoles_Click(object sender, EventArgs e)
        {
            string userID = ddlUsers.SelectedValue;
            foreach (ListItem item in lstRoles.Items)
            {
                // if role is selected and user is not in it, add user to role
                if (item.Selected)
                {
                    if (!userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.AddToRole(userID, item.Text);
                    }
                }
                // if role is not selected and user is in it, remove user from role
                else
                {
                    if (userMgr.IsInRole(userID, item.Text))
                    {
                        userMgr.RemoveFromRole(userID, item.Text);
                    }
                }
            }
        }

        private void Reload()
        {
            grdRoles.DataBind();
            ddlUsers.DataBind();
            lstRoles.DataBind();
        }

        // Provide for formatting GridView controls with Bootstrap
        protected void GridView_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;
            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}
