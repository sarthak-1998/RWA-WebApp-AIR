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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)// submit Event/Action
        {
            try
            {
                String conf = WebConfigurationManager.ConnectionStrings["con"].ConnectionString;
                SqlConnection conn = new SqlConnection(conf);
                conn.Open();
                //DataSet ds = new DataSet();
                //SqlDataAdapter da = new SqlDataAdapter();
                SqlCommand cmd = new SqlCommand("SP_registration", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                //cmd.Parameters.Add("@dob", SqlDbType.).Value = txtdob.Text;
                cmd.Parameters.AddWithValue("@dob", txtdob.Text);
                cmd.Parameters.AddWithValue("@mob", TextBox6.Text);
                cmd.Parameters.AddWithValue("@Email_ID", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Office", TextBox8.Text);
                cmd.Parameters.AddWithValue("@Designation", TextBox9.Text);
                cmd.Parameters.AddWithValue("@Blood_Group", TextBox7.Text);
                cmd.Parameters.AddWithValue("@Flat_type", TextBox3.Text);
                cmd.Parameters.AddWithValue("@Block_no", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Flat_no", TextBox5.Text);
                cmd.Parameters.AddWithValue("@no_family", TextBox10.Text);
                cmd.Parameters.AddWithValue("@password", TextBox12.Text);
                cmd.Parameters.AddWithValue("@flag", 1);
                int i = cmd.ExecuteNonQuery();
                if (i > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('Submitted Successfully')", true);
                }
                //da.SelectCommand = cmd;
                //da.Fill(ds);
            }
            catch(Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Script", "alert('EmailId Already Registered with us!!')", true);
            }
        }
        
        protected void Button2_Click(object sender, EventArgs e)//cancel button
        {
            Response.Redirect("home.aspx");//move to the next link i.e default.aspx
        }
    }
}