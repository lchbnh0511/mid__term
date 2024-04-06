using Dapper;
using DHSP.API.Models;
using DHSP.API.Models.Dtos;
using System.Data;
using System.Data.SqlClient;

namespace DHSP.API.Services
{
    public interface IDatabaseService
    {
        List<SinhVienDto> GetSinhViens();
        string InsertMonHoc(string tenMonHoc, int maNghanh, int soTinChi);
        string UpdateMonHoc(int maSinhVien, float diemCuoiKy, string monHoc);
        List<DanhSachDto> DanhSachDto();
    }

    public class DatabaseService : IDatabaseService
    {
        private readonly string _connectionString;
        public DatabaseService(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<SinhVienDto> GetSinhViens()
        {
            string sql = """
            select sv.maSinhVien, sv.hoTen, sv.namNhapHoc, svnh.ngayDangKy, nh.tenNghanh
            from SinhVien sv join SinhVienNghanhHoc svnh 
            on sv.maSinhVien = svnh.maSinhVien join NghanhHoc nh 
            on svnh.maNghanh = nh.maNghanh
            """;
            using var connection = GetConnection();
            return connection.Query<SinhVienDto>(sql).ToList();
        }

        public string InsertMonHoc(string tenMonHoc, int maNghanh, int soTinChi)
        {
            string sql = "themMonHoc";
            using var connection = GetConnection();
            var parameters = new DynamicParameters();
            parameters.Add("@tenMonHoc", tenMonHoc);
            parameters.Add("@maNghanh", maNghanh);
            parameters.Add("@soTinChi", soTinChi);


            var result = connection.Execute(sql, parameters, commandType: CommandType.StoredProcedure);
            if(result == 1)
            {
                return "thanh cong !!";
            }
            else
            {
                return "that bai!";
            }
            
        }

        public string UpdateMonHoc(int maSinhVien, float diemCuoiKy, string monHoc)
        {
            if (diemCuoiKy >= 0 && diemCuoiKy <= 10)
            {
                var parameters = new DynamicParameters();
                parameters.Add("@maMonHoc", monHoc);
                parameters.Add("@maSinhVien", maSinhVien);
                parameters.Add("@diemCuoiKy", diemCuoiKy);
                string sql = @"
            UPDATE SinhVienMonHoc SET diemCuoiKy = @diemCuoiKy
            WHERE maSinhVien = @maSinhVien AND maMon = @maMonHoc          
        ";
                using var connection = GetConnection();
                var result = connection.Execute(sql, parameters);
                if (result == 1)
                {
                    return "Thành công!";
                }
                else
                {
                    return "Thất bại!";
                }
            }
            else
            {
                return "Điểm nằm ngoài phạm vi!";
            }
        }

        public List<DanhSachDto> DanhSachDto()
        {
            string sql = """
            select nh.tenNghanh, Count(mh.tenMon) as tongMon, SUM(mh.soTinChi) as tongsoTinChi
            from NghanhHoc nh join MonHoc mh
            on nh.maNghanh = mh.maNghanh
            group by tenNghanh
            """;
            using var connection = GetConnection();
            return connection.Query<DanhSachDto>(sql).ToList();
        }

        private SqlConnection GetConnection()
        {
            return new SqlConnection(_connectionString);
        }
    }
}
