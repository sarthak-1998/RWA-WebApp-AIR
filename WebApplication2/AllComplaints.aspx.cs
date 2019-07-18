using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace WebApplication2
{
    public partial class AllComplaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["validloginflag"]) != 1)
            {
                Response.Redirect("home.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    bindgrd();
                    //bindgrd2();
                }
            }
        }
        private void bindgrd()
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_reg_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 5);
            cmd.Parameters.AddWithValue("@r_id", Convert.ToInt32(Session["candidateid"]));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            grdcomdetails.DataSource = dt;
            grdcomdetails.DataBind();
        }

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            Response.Redirect("complaint.aspx");
        }


        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;
            bindgrd();

        }

        protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //statusdetails
            if (e.CommandName == "statusdetails")
            {

                GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblcompidd = (Label)gvRow.FindControl("lblcompid");
                //Session["compid"] = lblcompidd.Text;
                bindgrd2(Convert.ToInt32(lblcompidd.Text));
                divprimary.Visible = false;
                divsecondary.Visible = true;
            }
        }
        private void bindgrd2(int x)
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_reg_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 6);
            cmd.Parameters.AddWithValue("@compid", x);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            grd2.DataSource = dt;
            grd2.DataBind();
        }

        

        protected void closedivs_Click(object sender, EventArgs e)
        {
            divprimary.Visible = true;
            divsecondary.Visible = false;
        }
    
    }
}


