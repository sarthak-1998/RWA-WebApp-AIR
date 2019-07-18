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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
            SqlConnection conn = new SqlConnection(conf);
            conn.Open();
            DataSet ds = new DataSet();
            
            SqlCommand cmd = new SqlCommand("SP_registration", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email_ID", txtusername.Text);
            cmd.Parameters.AddWithValue("@flag", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                string username = ds.Tables[0].Rows[0][0].ToString();
                string password = ds.Tables[0].Rows[0][1].ToString();
                if (username == txtusername.Text && password == txtpwd.Text)
                {
                   
                    Session["validloginflag"] = 1;
                    Session["candidateid"] = ds.Tables[0].Rows[0][3].ToString();
                    
                    if (Convert.ToInt16(ds.Tables[0].Rows[0][4]) == 1 || Convert.ToInt16(ds.Tables[0].Rows[0][4]) == 2 || Convert.ToInt16(ds.Tables[0].Rows[0][4]) == 3)
                    {
                        Session["usertype"] = ds.Tables[0].Rows[0][4].ToString();
                        Session["loginofficerid"] = ds.Tables[0].Rows[0][5].ToString();
                        Response.Redirect("CompliantStatus.aspx", true);
                    }
                    else
                    {
                        Response.Redirect("complaint.aspx", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Authentication Failed!!!!!!')", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Authentication Failed!!')", true);
            }

           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("contact.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }


    }


}