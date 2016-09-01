using DiamondD.Data.DataAccess.Report;

namespace DiamondD.Services.Report
{
    public interface IGetStudent1098TReportService
    {
        Student1098TReport GetStudent1098TPDF(int studentNo);
    }
}