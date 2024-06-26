USE [DHSP]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoMon](
	[maBoMon] [int] IDENTITY(1,1) NOT NULL,
	[tenBoMon] [nvarchar](50) NOT NULL,
	[maKhoa] [int] NOT NULL,
 CONSTRAINT [PK_BoMon] PRIMARY KEY CLUSTERED 
(
	[maBoMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[maKhoa] [int] IDENTITY(1,1) NOT NULL,
	[tenKhoa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[maKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[maMon] [int] IDENTITY(1,1) NOT NULL,
	[tenMon] [nvarchar](50) NOT NULL,
	[maNghanh] [int] NOT NULL,
	[soTinChi] [int] NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[maMon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NghanhHoc](
	[maNghanh] [int] IDENTITY(1,1) NOT NULL,
	[tenNghanh] [nvarchar](50) NOT NULL,
	[maBoMon] [int] NOT NULL,
 CONSTRAINT [PK_NghanhHoc] PRIMARY KEY CLUSTERED 
(
	[maNghanh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[maSinhVien] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[namNhapHoc] [date] NULL,
 CONSTRAINT [PK_SinhVien] PRIMARY KEY CLUSTERED 
(
	[maSinhVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienMonHoc](
	[maMon] [int] NOT NULL,
	[maSinhVien] [int] NOT NULL,
	[diemChuyenCan] [decimal](18, 1) NULL,
	[diemGiuaKy] [decimal](18, 1) NULL,
	[diemCuoiKy] [decimal](18, 1) NULL
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVienNghanhHoc](
	[maSinhVien] [int] NOT NULL,
	[maNghanh] [int] NOT NULL,
	[ngayDangKy] [date] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BoMon] ON 

INSERT [dbo].[BoMon] ([maBoMon], [tenBoMon], [maKhoa]) VALUES (1, N'Tin học 1', 3)
INSERT [dbo].[BoMon] ([maBoMon], [tenBoMon], [maKhoa]) VALUES (2, N'Toán học 1', 4)
INSERT [dbo].[BoMon] ([maBoMon], [tenBoMon], [maKhoa]) VALUES (3, N'Vật lý 1', 5)
SET IDENTITY_INSERT [dbo].[BoMon] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa]) VALUES (3, N'Tin Học')
INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa]) VALUES (4, N'Toán')
INSERT [dbo].[Khoa] ([maKhoa], [tenKhoa]) VALUES (5, N'Lý')
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (1, N'Môn 1', 1, 3)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (2, N'Môn 2', 2, 4)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (3, N'Môn 3', 3, 3)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (4, N'Binh 5', 1, 2)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (5, N'Binh 6', 2, 5)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (6, N'Binh 6', 2, 5)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (7, N'Binh 5', 3, 6)
INSERT [dbo].[MonHoc] ([maMon], [tenMon], [maNghanh], [soTinChi]) VALUES (8, N'Binhhh', 2, 2)
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[NghanhHoc] ON 

INSERT [dbo].[NghanhHoc] ([maNghanh], [tenNghanh], [maBoMon]) VALUES (1, N'Nghành học 1', 1)
INSERT [dbo].[NghanhHoc] ([maNghanh], [tenNghanh], [maBoMon]) VALUES (2, N'Nghành học 2', 2)
INSERT [dbo].[NghanhHoc] ([maNghanh], [tenNghanh], [maBoMon]) VALUES (3, N'Nghành học 3', 3)
SET IDENTITY_INSERT [dbo].[NghanhHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[SinhVien] ON 

INSERT [dbo].[SinhVien] ([maSinhVien], [hoTen], [namNhapHoc]) VALUES (1, N'Bình 1', CAST(N'2021-09-26' AS Date))
INSERT [dbo].[SinhVien] ([maSinhVien], [hoTen], [namNhapHoc]) VALUES (2, N'Bình 2', CAST(N'2020-05-22' AS Date))
INSERT [dbo].[SinhVien] ([maSinhVien], [hoTen], [namNhapHoc]) VALUES (3, N'Bình 3', CAST(N'2022-04-12' AS Date))
SET IDENTITY_INSERT [dbo].[SinhVien] OFF
GO
INSERT [dbo].[SinhVienMonHoc] ([maMon], [maSinhVien], [diemChuyenCan], [diemGiuaKy], [diemCuoiKy]) VALUES (1, 1, CAST(8.5 AS Decimal(18, 1)), CAST(9.0 AS Decimal(18, 1)), CAST(10.0 AS Decimal(18, 1)))
INSERT [dbo].[SinhVienMonHoc] ([maMon], [maSinhVien], [diemChuyenCan], [diemGiuaKy], [diemCuoiKy]) VALUES (2, 2, CAST(6.5 AS Decimal(18, 1)), CAST(8.0 AS Decimal(18, 1)), CAST(7.0 AS Decimal(18, 1)))
INSERT [dbo].[SinhVienMonHoc] ([maMon], [maSinhVien], [diemChuyenCan], [diemGiuaKy], [diemCuoiKy]) VALUES (3, 3, CAST(7.5 AS Decimal(18, 1)), CAST(9.5 AS Decimal(18, 1)), CAST(9.0 AS Decimal(18, 1)))
GO
INSERT [dbo].[SinhVienNghanhHoc] ([maSinhVien], [maNghanh], [ngayDangKy]) VALUES (1, 1, CAST(N'2022-07-12' AS Date))
INSERT [dbo].[SinhVienNghanhHoc] ([maSinhVien], [maNghanh], [ngayDangKy]) VALUES (2, 2, CAST(N'2023-02-11' AS Date))
INSERT [dbo].[SinhVienNghanhHoc] ([maSinhVien], [maNghanh], [ngayDangKy]) VALUES (3, 3, CAST(N'2021-04-23' AS Date))
GO
ALTER TABLE [dbo].[BoMon]  WITH CHECK ADD  CONSTRAINT [FK_BoMon_Khoa] FOREIGN KEY([maKhoa])
REFERENCES [dbo].[Khoa] ([maKhoa])
GO
ALTER TABLE [dbo].[BoMon] CHECK CONSTRAINT [FK_BoMon_Khoa]
GO
ALTER TABLE [dbo].[MonHoc]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc_NghanhHoc] FOREIGN KEY([maNghanh])
REFERENCES [dbo].[NghanhHoc] ([maNghanh])
GO
ALTER TABLE [dbo].[MonHoc] CHECK CONSTRAINT [FK_MonHoc_NghanhHoc]
GO
ALTER TABLE [dbo].[NghanhHoc]  WITH CHECK ADD  CONSTRAINT [FK_NghanhHoc_BoMon] FOREIGN KEY([maBoMon])
REFERENCES [dbo].[BoMon] ([maBoMon])
GO
ALTER TABLE [dbo].[NghanhHoc] CHECK CONSTRAINT [FK_NghanhHoc_BoMon]
GO
ALTER TABLE [dbo].[SinhVienMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_SinhVienMonHoc_MonHoc] FOREIGN KEY([maMon])
REFERENCES [dbo].[MonHoc] ([maMon])
GO
ALTER TABLE [dbo].[SinhVienMonHoc] CHECK CONSTRAINT [FK_SinhVienMonHoc_MonHoc]
GO
ALTER TABLE [dbo].[SinhVienMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_SinhVienMonHoc_SinhVien] FOREIGN KEY([maSinhVien])
REFERENCES [dbo].[SinhVien] ([maSinhVien])
GO
ALTER TABLE [dbo].[SinhVienMonHoc] CHECK CONSTRAINT [FK_SinhVienMonHoc_SinhVien]
GO
ALTER TABLE [dbo].[SinhVienNghanhHoc]  WITH CHECK ADD  CONSTRAINT [FK_SinhVienNghanhHoc_NghanhHoc] FOREIGN KEY([maNghanh])
REFERENCES [dbo].[NghanhHoc] ([maNghanh])
GO
ALTER TABLE [dbo].[SinhVienNghanhHoc] CHECK CONSTRAINT [FK_SinhVienNghanhHoc_NghanhHoc]
GO
ALTER TABLE [dbo].[SinhVienNghanhHoc]  WITH CHECK ADD  CONSTRAINT [FK_SinhVienNghanhHoc_SinhVien] FOREIGN KEY([maSinhVien])
REFERENCES [dbo].[SinhVien] ([maSinhVien])
GO
ALTER TABLE [dbo].[SinhVienNghanhHoc] CHECK CONSTRAINT [FK_SinhVienNghanhHoc_SinhVien]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[themMonHoc]
 @tenMonHoc nvarchar(50), @soTinChi int, @maNghanh int
as

begin
	if(@tenMonHoc is null or @tenMonHoc = '')
	begin
		select N'Phai nhap ten mon hoc'as mess
		return;
	end
	if not exists (select 1
	from NghanhHoc
	where maNghanh = @maNghanh)
	begin
		select N'Ma Nghanh k ton tai'
		as mess
		return;	
	end 
	if(@soTinChi <1 or @soTinChi > 10)
	begin
		select N'So Tin Chi Ngoai Pham Vi' as mess
		return;
	end

INSERT INTO MonHoc(tenMon,  soTinChi,maNghanh)
VALUES
(@tenMonHoc, @soTinChi, @maNghanh)
	select N'Them moi thanh cong!' as mess
end
GO
