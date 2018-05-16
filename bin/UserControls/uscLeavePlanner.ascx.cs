using DevExpress.ExpressApp.Editors;
using System;
using System.Linq;
using System.Web.UI.WebControls;
using DevExpress.ExpressApp;
using DevExpress.ExpressApp.Web;
using System.Drawing;
using HCM10.Module.BusinessObjects.PersonnelAdministration;
using HCM10.Module.BusinessObjects.OrganizationManagement;
using DevExpress.ExpressApp.Xpo;
using DevExpress.Xpo;
using HCM10.Module.BusinessObjects.Workflow.Leave;
using HCM10.Module.BusinessObjects.Workflow;
using DevExpress.Web;

namespace HCM10.Web.UserControls
{
    public partial class uscLeavePlanner : System.Web.UI.UserControl, IComplexControl
    {
        IObjectSpace object_Space = null;
        WebApplication xafApplication = null;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        void IComplexControl.Refresh()
        {

        }

        void IComplexControl.Setup(IObjectSpace objectSpace, XafApplication application)
        {
            try
            {
                object_Space = objectSpace;
                this.xafApplication = (WebApplication)application;
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected override void OnInit(EventArgs e)
        {
            try
            {
                base.OnInit(e);
                if (xafApplication.ClientServerInfo.GetValue<string>("cmbDepartment") != null)
                {
                    cmbDepartment.Text = xafApplication.ClientServerInfo.GetValue<string>("cmbDepartment");
                }
                if (xafApplication.ClientServerInfo.GetValue<string>("cmbEmployee") != null)
                {
                    cmbEmployee.Text = xafApplication.ClientServerInfo.GetValue<string>("cmbEmployee");
                }
                BindEmployee();
                BindDepartment();
                BindSchedular();
            }
            catch (Exception ex)
            {
                throw new Exception("OnInit :" + ex.Message);
            }


        }
        private void BindEmployee()
        {
            var ds = object_Space.GetObjects<Employee>();
            if (cmbDepartment.Text != "")
                ds = ds.Where(x =>  (x.CurrentDepartment != null ? x.CurrentDepartment.NameEn : "")  == cmbDepartment.Text).ToList();
            cmbEmployee.Items.Clear();
            cmbEmployee.DataBind();
            foreach (var rec in ds)
            {
                cmbEmployee.Items.Add(rec.FullNameEn);
            }
        }
        private void BindDepartment()
        {
            var ds = object_Space.GetObjects<OrganizationUnit>().Where(r=>r.OrgUnitType == OrgUnitType.Department);
            cmbDepartment.Items.Clear();
            foreach (var rec in ds)
            {
                cmbDepartment.Items.Add(rec.NameEn);
            }
        }

        private void BindSchedular()
        {
            Session currentSession = ((XPObjectSpace)object_Space).Session;
            // dummy ds
            var ds = object_Space.GetObjects<LeavePlanner>().Where(r => r.RequestStatus == RequestStatus.Approved).Select(r => new { Oid = 0, AllDay = 1, Description = "", EndTime = new DateTime(1800,1,1), Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = new DateTime(1800, 1, 1), Status = "", Subject = "", EvenType = "", Employee = r.Employee }).ToList().Take(1);
            var ds1 = ds;
            var ds2 = ds;
            var ds3 = ds;
            var ds4 = ds;       
            var ds5 = ds;
            var ds6 = ds;
            if (chkPlannedLeaveApprove.Checked)
                ds1= object_Space.GetObjects<LeavePlanner>().Where(r=>r.RequestStatus ==RequestStatus.Approved).Select(r=> new { Oid = (r.Employee!=null?r.Employee.Oid:0), AllDay = 1, Description= (r.Employee != null ? r.Employee.FullNameEn:""),EndTime=r.EndDate,Label="",Location="", recurrenceinfo=0,reminderinfo=0,firmId=1,StartTime=(r.StartDate.ToString("hh:mm")=="00:00"?r.StartDate.AddMinutes(59).AddHours(23):r.StartDate),Status="",Subject= (r.Employee != null ? r.Employee.FullNameEn:""),EvenType="",Employee=r.Employee} );
            if (chkPlannedLeaveUnApprove.Checked)
                ds2 = object_Space.GetObjects<LeavePlanner>().Where(r => r.RequestStatus != RequestStatus.Approved).Select(r => new { Oid = (r.Employee != null ? r.Employee.Oid : 0), AllDay = 1, Description = (r.Employee != null ? r.Employee.FullNameEn : ""), EndTime = r.EndDate, Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = (r.StartDate.ToString("hh:mm") == "00:00" ? r.StartDate.AddMinutes(59).AddHours(23) : r.StartDate), Status = "", Subject = (r.Employee != null ? r.Employee.FullNameEn : ""), EvenType = "", Employee = r.Employee });
            if(chkLeaveApprove.Checked)
                ds3 = object_Space.GetObjects<LeaveRequest>().Where(r => r.RequestStatus == RequestStatus.Approved).Select(r => new { Oid = (r.Employee != null ? r.Employee.Oid : 0), AllDay = 1, Description = (r.Employee != null ? r.Employee.FullNameEn : ""), EndTime = r.EndDate, Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = (r.StartDate.ToString("hh:mm") == "00:00" ? r.StartDate.AddMinutes(59).AddHours(23) : r.StartDate), Status = "", Subject = (r.Employee != null ? r.Employee.FullNameEn : ""), EvenType = "", Employee = r.Employee });
            if (chkLeaveUnapproved.Checked)
                ds4 = object_Space.GetObjects<LeaveRequest>().Where(r => r.RequestStatus != RequestStatus.Approved).Select(r => new { Oid = (r.Employee != null ? r.Employee.Oid : 0), AllDay = 1, Description = (r.Employee != null ? r.Employee.FullNameEn : ""), EndTime = r.EndDate, Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = (r.StartDate.ToString("hh:mm") == "00:00" ? r.StartDate.AddMinutes(59).AddHours(23) : r.StartDate), Status = "", Subject = (r.Employee != null ? r.Employee.FullNameEn : ""), EvenType = "", Employee = r.Employee });
            if (chkLeaveApprove.Checked)
                ds5 = object_Space.GetObjects<LeaveAmendmentRequest>().Where(r => r.RequestStatus == RequestStatus.Approved).Select(r => new { Oid = (r.Employee != null ? r.Employee.Oid : 0), AllDay = 1, Description = (r.Employee != null ? r.Employee.FullNameEn : ""), EndTime = r.EndDate, Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = (r.StartDate.ToString("hh:mm") == "00:00" ? r.StartDate.AddMinutes(59).AddHours(23) : r.StartDate), Status = "", Subject = (r.Employee != null ? r.Employee.FullNameEn : ""), EvenType = "", Employee = r.Employee });
            if (chkLeaveUnapproved.Checked)
                ds6 = object_Space.GetObjects<LeaveAmendmentRequest>().Where(r => r.RequestStatus != RequestStatus.Approved).Select(r => new { Oid = (r.Employee != null ? r.Employee.Oid : 0), AllDay = 1, Description = (r.Employee != null ? r.Employee.FullNameEn : ""), EndTime = r.EndDate, Label = "", Location = "", recurrenceinfo = 0, reminderinfo = 0, firmId = 1, StartTime = (r.StartDate.ToString("hh:mm") == "00:00" ? r.StartDate.AddMinutes(59).AddHours(23) : r.StartDate), Status = "", Subject = (r.Employee != null ? r.Employee.FullNameEn : ""), EvenType = "", Employee = r.Employee });
            //String sqlAppointment = "SELECT leave.Oid,0 as AllDay,emp.FullNameEn as Description, (CAST(EndDate as Datetime) + CAST(EndTime as Time)) as EndTime, '' as Label, '' as Location,0 as recurrenceinfo,0 as reminderinfo, 1 as firmId,(CAST(StartDate as Datetime) + CAST(StartTime as Time)) as StartTime,'' as Status,emp.FullNameEn as Subject,'' as EvenType  FROM [EmployeeAbsence] leave inner join [Employee] emp on leave.Employee = emp.Oid";
            //if (cmbEmployee.Text != "" || cmbDepartment.Text != "")
            //    sqlAppointment += " where ";
            //if (cmbEmployee.Text != "")
            //    sqlAppointment += " emp.FullNameEn='"+ cmbEmployee.Text + "' ";
            //if (cmbDepartment.Text != "")
            //    sqlAppointment += " emp.FullNameEn='" + cmbDepartment.Text + "' ";
            //XPDataView xpDataView1 = new XPDataView();
            //xpDataView1.AddProperty("Oid", typeof(int));
            //xpDataView1.AddProperty("AllDay", typeof(string));
            //xpDataView1.AddProperty("Description", typeof(string));
            //xpDataView1.AddProperty("EndTime", typeof(DateTime));
            //xpDataView1.AddProperty("Label", typeof(string));
            //xpDataView1.AddProperty("Location", typeof(string));
            //xpDataView1.AddProperty("recurrenceinfo", typeof(int));
            //xpDataView1.AddProperty("reminderinfo", typeof(int));
            //xpDataView1.AddProperty("firmId", typeof(int));
            //xpDataView1.AddProperty("StartTime", typeof(DateTime));
            //xpDataView1.AddProperty("Status", typeof(string));
            //xpDataView1.AddProperty("Subject", typeof(string));
            //xpDataView1.AddProperty("EvenType", typeof(string));
            //xpDataView1.LoadData(currentSession.ExecuteQuery(sqlAppointment));
            //ASPxScheduler1.AppointmentDataSource = xpDataView1;
            ds = ds.Union(ds1).Union(ds2).Union(ds3).Union(ds4).Union(ds5).Union(ds6);
            if (cmbEmployee.Text != "" && cmbEmployee.Text != null)
                ds = ds.Where(x=>(x.Employee!=null?x.Employee.FullNameEn:"")== cmbEmployee.Text);
            if (cmbDepartment.Text != "" && cmbDepartment.Text != null)
                ds = ds.Where(x => (x.Employee != null ? (x.Employee.CurrentDepartment != null ? x.Employee.CurrentDepartment.NameEn :""):"") == cmbDepartment.Text);
            ASPxScheduler1.AppointmentDataSource = ds;
            XPDataView xpDataView2 = new XPDataView();
            String sqlResource = "SELECT 1 as Id, 'Test' as Model";
            xpDataView2.AddProperty("Id", typeof(string));
            xpDataView2.AddProperty("Model", typeof(string));
            xpDataView2.LoadData(currentSession.ExecuteQuery(sqlResource));
            ASPxScheduler1.ResourceDataSource = xpDataView2;
            ASPxScheduler1.DataBind();
            
        }
        protected void ASPxScheduler1_AppointmentViewInfoCustomizing(object sender, DevExpress.Web.ASPxScheduler.AppointmentViewInfoCustomizingEventArgs e)
        {
            Random r = new Random();
            e.ViewInfo.AppointmentStyle.BackColor = Color.Firebrick;
            if (Int32.Parse(e.ViewInfo.Appointment.Id.ToString())%2==0)
            e.ViewInfo.AppointmentStyle.BackColor = Color.Red;
            if (Int32.Parse(e.ViewInfo.Appointment.Id.ToString()) % 3 == 0)
                e.ViewInfo.AppointmentStyle.BackColor = Color.Blue;
            if (Int32.Parse(e.ViewInfo.Appointment.Id.ToString()) % 5 == 0)
                e.ViewInfo.AppointmentStyle.BackColor = Color.Yellow;
            if (Int32.Parse(e.ViewInfo.Appointment.Id.ToString()) % 7 == 0)
                e.ViewInfo.AppointmentStyle.BackColor = Color.Green;
            if (Int32.Parse(e.ViewInfo.Appointment.Id.ToString()) % 11 == 0)
                e.ViewInfo.AppointmentStyle.BackColor = Color.MediumAquamarine;
        }

        protected void cmbEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }

        protected void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindEmployee();
            BindSchedular();
        }

        protected void chkLeaveApprove_CheckedChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }

        protected void chkLeaveUnapproved_CheckedChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }

        protected void chkPlannedLeaveApprove_CheckedChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }

        protected void chkPlannedLeaveUnApprove_CheckedChanged(object sender, EventArgs e)
        {
            BindSchedular();
        }
        protected void ASPxCallbackPanelPeriod_Callback(object source, CallbackEventArgsBase e)
        {
            BindSchedular();
        }
    }

}