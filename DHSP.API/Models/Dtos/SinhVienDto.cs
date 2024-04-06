namespace DHSP.API.Models.Dtos
{
    public class SinhVienDto
    {
        public int maSinhVien { get; set; }
        public string? hoTen { set; get; }
        public DateTime namNhapHoc { get; set; }
        public DateTime ngayDangKy { get; set; }
        public string? tenNghanh { get; set; }
    }
    public class DanhSachDto
    {
        public string? tenNghanh { set; get; }
        public int soTinChi { get; set; }
        public int soMonHoc { get; set; }

    }
}
