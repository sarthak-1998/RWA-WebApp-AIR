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
    public partial class login : System.Web.UI.Page
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
                    binddropdown();
                }
            }
           
        }
        private void binddropdown()
        {
           
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataTable dt = new DataTable();
          
            SqlCommand cmd = new SqlCommand("sp_complaint_type", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", 1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            ddlcomtype.DataSource = dt;

            ddlcomtype.DataValueField = "c_id";
            ddlcomtype.DataTextField = "c_type";
            ddlcomtype.DataBind();
            

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            //DataSet ds = new DataSet();
            //SqlDataAdapter da = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("sp_reg_complaint", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ctypeid", Convert.ToInt16(ddlcomtype.SelectedItem.Value));
           
            cmd.Parameters.AddWithValue("@c_des", TextBox1.Text);
            cmd.Parameters.AddWithValue("@flag",1);
            cmd.Parameters.AddWithValue("@r_id", Convert.ToInt32(Session["candidateid"]));
            cmd.Parameters.Add("@compidout", SqlDbType.Int);
            cmd.Parameters["@compidout"].Direction = ParameterDirection.Output;
            int i = cmd.ExecuteNonQuery();
            conn.Close();
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Complaint Registered Successfully')", true);

            }
            
          
            TextBox1.Text = "";
            //conn.Open();
            //SqlCommand cmd1 = new SqlCommand("sp_reg_complaint", conn);
            //cmd1.Parameters.AddWithValue("@r_id", Convert.ToInt32(Session["candidateid"]));
            //cmd1.Parameters.Add("@compidout", SqlDbType.Int);
            //cmd1.Parameters["@compidout"].Direction = ParameterDirection.Output;
            //cmd1.Parameters.AddWithValue("@flag",3);
            //int x = cmd1.ExecuteNonQuery();
            
            //conn.Close();
            
            //if (x > 0)
            //{


            //    int compid = (int)cmd1.Parameters["@compidout"].Value;
            //}
            
               
                  
                
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("complaint.aspx");//move to the next link i.e default.aspx
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AllComplaints.aspx");
        }

       

        
    }
}