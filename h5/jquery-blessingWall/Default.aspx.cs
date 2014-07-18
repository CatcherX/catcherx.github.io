using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blessingWall_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.InitCtrols();
    }

    private void InitCtrols()
    {
        //string sql = "SELECT * FROM Leave";
        //Xue.Data.QueryHelper queryHelper = new Xue.Data.QueryHelper(sql);        
        //this.rptLeaveContent.DataSource = queryHelper.ExecuteDataTable();
        //this.rptLeaveContent.DataBind();

        string[] content = System.IO.File.ReadAllText(HttpContext.Current.Server.MapPath("~/H5/blessingWall/leaveTxt/LeaveContent.config"), System.Text.Encoding.UTF8).Split(new char[] { '\r', '\n' }, StringSplitOptions.RemoveEmptyEntries);
        int rowsLength = content.Length;
        if (rowsLength > 0)
        {
            System.Data.DataTable dtImageList = new System.Data.DataTable();
            dtImageList.Columns.Add("LeaveContent");
            for (int i = 0; i < rowsLength; i++)
            {
                dtImageList.Rows.Add(content[i].Split('|')[0]);
            }
            this.rptLeaveContent.DataSource = dtImageList;
            this.rptLeaveContent.DataBind();
        }
    }
    protected int GetRomNum()
    {
        return int.Parse(Xue.Helper.RandomUtils.GetRandomCode(1, "123456"));
    }
}