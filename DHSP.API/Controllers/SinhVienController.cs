using DHSP.API.Services;
using Microsoft.AspNetCore.Mvc;

namespace DHSP.API.Controllers
{
    [Route("api/[controller]")]
    public class SinhVienController : Controller
    {
        private readonly IDatabaseService _databaseService;

        public SinhVienController(IDatabaseService databaseService)
        {
            _databaseService = databaseService;
        }

        [HttpGet]
        [Route("get-sinhvien")]
        public IActionResult GetSinhViens()
        {
            var items = _databaseService.GetSinhViens();

            return Ok(items);
        }


        [HttpPost]
        [Route("add-sinhvien")]
        public IActionResult InsertMonHoc(string tenMonHoc, int maNghanh, int soTinChi)
        {
            var items = _databaseService.InsertMonHoc(tenMonHoc, maNghanh, soTinChi);

            return Ok(items);
        }
        [HttpPost]
        [Route("update-sinhvien")]
        public IActionResult UpdateMonHoc(int maSinhVien, float diemCuoiKy, string monHoc)
        {
            var items = _databaseService.UpdateMonHoc(maSinhVien, diemCuoiKy, monHoc);

            return Ok(items);
        }
        [HttpGet]
        [Route("get-danhsach")]
        public IActionResult DanhSachDto()
        {
            var items = _databaseService.DanhSachDto();

            return Ok(items);
        }
    }
}
