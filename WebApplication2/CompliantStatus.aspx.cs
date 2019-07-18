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
using System.Drawing;

namespace WebApplication2
{
    public partial class CompliantStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["validloginflag"]) != 1)
            {
                Response.Redirect("home.aspx");
            }
            else
            {
                for (int i = 0; i < CheckBoxList1.Items.Count; i++)
                {
                    CheckBoxList1.Items[i].Attributes.Add("onclick", "MutExChkList(this)");
                }
                if (!IsPostBack)
                {
                    binddropdown();
                    bindgrd(0, 2);
                    binddropdown2();
                }
            }

        }
        private void bindgrd(int s, int f)
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();
            SqlCommand cmd = new SqlCommand("sp_trn_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", f);
            cmd.Parameters.AddWithValue("@officerid", Convert.ToInt32(Session["loginofficerid"]));
            cmd.Parameters.AddWithValue("@statusflag", s);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            grdcomdetails.DataSource = dt;
            grdcomdetails.DataBind();
        }
        private void binddropdown()
        {

            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand("sp_complaint_status_type", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataValueField = "comp_status_id";
            DropDownList1.DataTextField = "comp_status_type";
            DropDownList1.DataBind();


        }

        private void binddropdown2()
        {

            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand("SP_Officer", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 1);
            cmd.Parameters.AddWithValue("@usertypeid", Convert.ToInt32(Session["usertype"]));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ddloftype.DataSource = dt;
            ddloftype.DataValueField = "officerid";
            ddloftype.DataTextField = "Officer";
            ddloftype.DataBind();

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {


        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("home.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            bindgrd(Convert.ToInt16(DropDownList1.SelectedValue), 3);
        }

        protected void grdcomdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdcomdetails.PageIndex = e.NewPageIndex;


        }


        //protected void grdcomdetails_RowCommand(object sender, GridViewCommandEventArgs e)
        //{
        //    //statusdetails
        //    if (e.CommandName == "statusdetails")
        //    {

        //        GridViewRow gvRow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        //        Label lblcompidd = (Label)gvRow.FindControl("lblcompid");
        //        LinkButton lblsts = (LinkButton)gvRow.FindControl("lblsts");
        //        //Session["compid"] = lblcompidd.Text;
        //        if (lblsts.Text == "Pending")
        //            divresorfor.Visible = true;
        //        else if (lblsts.Text == "Forwarded")
        //        {
        //            divresorfor.Visible = false;
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint has been Forwarded!!!!!!')", true);
        //        }
        //        else
        //        {
        //            divresorfor.Visible = false;
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint has been resolved!!!!!!')", true);
        //        }


        //    }
        //}

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //divresorfor.Visible = true;
            if (CheckBoxList1.SelectedValue == "1")
            {
                divsubmit.Visible = true;
                divforward.Visible = false;
            }
            else if (CheckBoxList1.SelectedValue == "3")
            {
                divforward.Visible = true;
                divsubmit.Visible = false;
            }
            else
            {
                divforward.Visible = false;
                divsubmit.Visible = false;
            }
        }

        protected void grdcomdetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row1 = grdcomdetails.Rows[grdcomdetails.SelectedIndex];

            Label chk = (Label)row1.FindControl("lblcompid");
            ViewState["lblcompid"] = chk.Text;
            Label lblsts = (Label)row1.FindControl("lblsts");
            Label lbltrcomid = (Label)row1.FindControl("lbltrcomid");
            ViewState["trcomid"] = lbltrcomid.Text;
            Label lblfinalstatus = (Label)row1.FindControl("lblfinalstatus");
            ViewState["lblfinalstatus"] = lblfinalstatus.Text;
            //Session["compid"] = lblcompidd.Text;
            if (lblsts.Text == "Pending" && !Convert.ToBoolean(ViewState["lblfinalstatus"]))
                divresorfor.Visible = true;
            else if (lblsts.Text == "Forwarded" && !Convert.ToBoolean(ViewState["lblfinalstatus"]))
            {
                divresorfor.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint has been Forwarded!!!!!!')", true);
            }
            else
            {
                divresorfor.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint has been resolved!!!!!!')", true);
            }



            foreach (GridViewRow row in grdcomdetails.Rows)
            {
                if (row.RowIndex == grdcomdetails.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;

                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        protected void grdcomdetails_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grdcomdetails, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
                e.Row.Attributes.Add("onmouseover", "MouseEvent(this, event)");
                e.Row.Attributes.Add("onmouseout", "MouseEvent(this, event)");


                //ImageButton imgbtnUpdate = (ImageButton)e.Row.FindControl("imgbtnUpdate");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("sp_trn_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@forwardtowhom", Convert.ToInt16(ddloftype.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@remarks", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@flag", 4);
            cmd.Parameters.AddWithValue("@tr_com_id", Convert.ToInt32(ViewState["trcomid"]));
            cmd.Parameters.AddWithValue("@comp_id", Convert.ToInt32(ViewState["lblcompid"]));

            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i > 0)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint forwarded Successfully')", true);
                bindgrd(0, 2);
                divforward.Visible = false;
                divsubmit.Visible = false;

                divresorfor.Visible = false;

            }
            TextBox1.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("sp_trn_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@officerid", Convert.ToInt32(Session["loginofficerid"]));
            //cmd.Parameters.AddWithValue("@remarks", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@flag", 5);
            cmd.Parameters.AddWithValue("@tr_com_id", Convert.ToInt32(ViewState["trcomid"]));
            cmd.Parameters.AddWithValue("@comp_id", Convert.ToInt32(ViewState["lblcompid"]));

            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint resolved Successfully')", true);
                bindgrd(0, 2);
                divforward.Visible = false;
                divsubmit.Visible = false;
                divresorfor.Visible = false;

            }
            TextBox1.Text = "";
        }
    }
}