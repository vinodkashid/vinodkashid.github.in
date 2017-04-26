using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BOOKSHOP
{
    public partial class books : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=PRAMOD-PC\SQLEXPRESS;Initial Catalog=dbbooks;Integrated Security=True");
        int id;
        string BookName;
        string Author;
        string Publisher;
        string Price;
        
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showdata();
            }

        }

        private void showdata()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM tblbooks", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sa = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sa.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gridview1.DataSource = dt;
                gridview1.DataBind();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            BookName=txt_bookname.Text;
            Author=txt_author.Text;
            Publisher = txt_publisher.Text;
            Price = txt_price.Text;
           
            SqlCommand cmd = new SqlCommand("SPINSERT", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@BookName", BookName);
            cmd.Parameters.AddWithValue("@Author", Author);
            cmd.Parameters.AddWithValue("@Publicatiom", Publisher);
            cmd.Parameters.AddWithValue("@Price", Price);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            showdata();



        }

        protected void btnreset_Click(object sender, EventArgs e)
        {
           
            txt_bookname.Text = "";
            txt_author.Text = "";
            txt_publisher.Text = "";
            txt_price.Text = "";
            
            
        }

        protected void gridview1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {

        }

        protected void gridview1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridview1.EditIndex = e.NewEditIndex;
            showdata();


        }

        //protected void gridview1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
           

        //}

        protected void gridview1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = (gridview1.Rows[e.RowIndex].FindControl("lblId")) as Label;
            con.Open();
            SqlCommand cmd = new SqlCommand("SPDELETE", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            showdata();



        }

        protected void gridview1_RowUpdating1(object sender, GridViewUpdateEventArgs e)
        {
            Label id = (gridview1.Rows[e.RowIndex].FindControl("lblId")) as Label;
            TextBox BookName = (gridview1.Rows[e.RowIndex].FindControl("txtbookname")) as TextBox;
            TextBox Author = (gridview1.Rows[e.RowIndex].FindControl("txtauthor")) as TextBox;
            TextBox Publisher = (gridview1.Rows[e.RowIndex].FindControl("txtpublication")) as TextBox;
            TextBox Price = (gridview1.Rows[e.RowIndex].FindControl("txtprice")) as TextBox;
            con.Open();
            SqlCommand cmd = new SqlCommand("SPUPDATE", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", id.Text);
            cmd.Parameters.AddWithValue("@BookName", BookName.Text);
            cmd.Parameters.AddWithValue("@Author", Author.Text);
            cmd.Parameters.AddWithValue("@Publicatiom", Publisher.Text);
            cmd.Parameters.AddWithValue("@Price", Price.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            showdata();

        }
    }
}