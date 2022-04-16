create
database QLBanSach;
use QLBanSach;

create table KhachHang
(
    MaKH      varchar(20),
    TaiKhoan  varchar(50),
    MatKhau   varchar(30),
    Email     varchar(30),
    DiaChi    varchar(100),
    DienThoai varchar(20),
    GioiTinh  varchar(10),
    NgaySinh  varchar(15),
    HoTen     varchar(50),
    PRIMARY KEY (MaKH)
);

create table DonHang
(
    MaDonHang   varchar(20),
    DaThanhToan int,
    NgayGiao    varchar(30),
    NgayDat     varchar(30),
    TinhTrangDH varchar(100),
    MaKH        varchar(20),
    PRIMARY KEY (MaDonHang),
    CONSTRAINT fk_MaKH_from_DonHang_to_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)
);

create table ChuDe
(
    MaChuDe  varchar(20),
    TenChuDe varchar(30),
    PRIMARY KEY (MaChuDe)
);

create table TacGia
(
    MaTacGia  varchar(20),
    TenTacGia varchar(50),
    DiaChi    varchar(100),
    TieuSu    varchar(100),
    DienThoai varchar(20),
    PRIMARY KEY (MaTacGia)
);

create table NhaXuatBan
(
    MaNXB  varchar(20),
    TenNXB varchar(50),
    DiaChi varchar(100),
    PRIMARY KEY (MaNXB)
);

create table Sach
(
    MaSach      varchar(20),
    TenSach     varchar(50),
    GiaBan      double,
    MoTa        varchar(100),
    AnhBia      varchar(100),
    NgayCapNhat varchar(20),
    SoLuongTon  int,
    MaChuDe     varchar(20),
    MaNXB       varchar(20),
    CONSTRAINT fk_MaChuDe_from_Sach_to_ChuDe FOREIGN KEY (MaChuDe) REFERENCES ChuDe (MaChuDe),
    CONSTRAINT fk_MaNXB_from_Sach_to_NhaXuatBan FOREIGN KEY (MaNXB) REFERENCES NhaXuatBan (MaNXB),
    PRIMARY KEY (MaSach)
);

create table DonHang_Sach
(
    MaDonHang varchar(20),
    MaSach    varchar(20),
    SoLuong   int,
    DonGia    double,
    CONSTRAINT fk_MaDonHang_from_DonHangSach_to_DonHang FOREIGN KEY (MaDonHang) REFERENCES DonHang (MaDonHang),
    CONSTRAINT fk_MaSach_from_DonHangSach_to_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach),
    PRIMARY KEY (MaSach, MaDonHang)
);

create table TacGia_Sach
(
    MaTacGia varchar(20),
    MaSach   varchar(20),
    VaiTro   varchar(30),
    ViTri    varchar(30),
    CONSTRAINT fk_MaTacGia_from_TacGiaSach_to_TacGia FOREIGN KEY (MaTacGia) REFERENCES TacGia (MaTacGia),
    CONSTRAINT fk_MaSach_from_TacGiaSach_to_Sach FOREIGN KEY (MaSach) REFERENCES Sach (MaSach),
    PRIMARY KEY (MaSach, MaTacGia)
);




