<?php 

include "../fungsi/koneksi.php";
include "../fungsi/fungsi.php";

ob_start(); 
$id  = isset($_GET['id']) ? $_GET['id'] : false;


$tanggala=$_POST['tanggala'];
$tanggalb=$_POST['tanggalb'];


?>
<!-- Setting CSS bagian header/ kop -->
<style type="text/css">
  table.page_header {width: 1020px; border: none; background-color: #DDDDFF; border-bottom: solid 1mm #AAAADD; padding: 2mm }
  table.page_footer {width: 1020px; border: none; background-color: #DDDDFF; border-top: solid 1mm #AAAADD; padding: 2mm}
  
  
</style>
<!-- Setting Margin header/ kop -->
<!-- Setting CSS Tabel data yang akan ditampilkan -->
<style type="text/css">
 .tabel2 {
  border-collapse: collapse;
  margin-left: 5px;
}
.tabel2 th, .tabel2 td {
  padding: 5px 5px;
  border: 1px solid #000;
}


div.tengah {
 position: absolute;
 bottom: 100px;
 right: 330px;
 
}

div.kanan {
 width:300px;
 float:right;
 margin-left:250px;
 margin-top:-235px;
}

div.kiri {
  width:300px;
  float:left;
  margin-left:20px;
  display:inline;
}

</style>
</style>
<head>
  <title>Laporan Data Pengajuan Barang</title>
  <link href="../css/styles_laporan.css" type="text/css" rel="stylesheet" />
<script>
    window.load = print_d();
    function print_d(){
        window.print();
    }
  window.onfocus=function(){ 
    window.close();
  }
</script>
</head>
<body>  
         
                      <left><img src="../gambar/CPF.png" width="110px" height="110" ></left>
                      <br
       <div class="judul">

            <h4><b>PT CHAROEN POKPHAND JAYA FARM
            <br>
           BANJARMASIN 1
              <br></b>
            <h6>Jalan Datu Insad Rt. 04 Rw. 01 Desa Sambangan Kecamatan Bati-Bati
            <br>Kabupaten Tanah Laut Provinsi Kalimantan Selatan Kode Pos 70852 </h6>
            <br>
            <br>

            
            
        </div>
        <hr class="garis">
         <H4><b>BUKTI PENGAJUAN PERMINTAAN BARANG (BPP)</b></H4>
  <hr>


  <div class="isi" style="margin: 0 auto;">
    Periode :<?=  tanggal_indo($tanggala); ?> S/d <?= tanggal_indo($tanggalb);?>
    <br>
    <br>

    <table border="1" align="center" style="border-collapse:collapse;" width="100%">
       <tr>
         <td width="50" align="center"><b>No</b></td>
              <th>Kode Barang</th>        				
               <th>Nama Barang</th>
               <th>Satuan</th>
               <th>Jumlah</th> 
             

            </tr>
    
      <tbody>
        <?php
        include "../fungsi/koneksi.php";



        $query = mysqli_query($koneksi, "SELECT  pengajuan.tgl_pengajuan, pengajuan.id_pengajuan, pengajuan.unit, pengajuan.kode_brg, pengajuan.jumlah,  pengajuan.status, stokbarang.nama_brg, stokbarang.satuan FROM pengajuan INNER JOIN stokbarang ON pengajuan.kode_brg = stokbarang.kode_brg WHERE status=1 ORDER BY tgl_pengajuan BETWEEN '$tanggala' AND '$tanggalb'"); 
        $i   = 1; 
        while($data=mysqli_fetch_array($query))
        {
          ?>

          <tr>
           <td style="text-align: center; font-size: 12px;"><?php echo $i; ?></td>             
           <td style="text-align: center; font-size: 12px;"><?php echo $data['kode_brg']; ?></td>
           <td style="text-align: left; font-size: 12px;"><?php echo $data['nama_brg']; ?></td>
           <td style="text-align: center; font-size: 12px;"><?php echo $data['satuan']; ?></td>
           <td style="text-align: center; font-size: 12px;"><?php echo $data['jumlah']; ?></td>


         </tr>
         <?php
         $i++;
       }
       ?>
     </tbody>
   </table> 
  
</div>

<?php 
 
 include "../fungsi/koneksi.php";

  $query = "SELECT * FROM user WHERE user.level ='Manager' ";
    $hasil = mysqli_query($koneksi,$query);
  
?>
              <?php 
              $no = 1;
                  while ($data = mysqli_fetch_assoc($hasil)):

               ?>
 

               <div class="ttd">
      <!--
      var months = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
      var myDays = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum&#39;at', 'Sabtu'];
      var date = new Date();
      var day = date.getDate();
      var month = date.getMonth();
      var thisDay = date.getDay(),
          thisDay = myDays[thisDay];
      var yy = date.getYear();
      var year = (yy < 1000) ? yy + 1900 : yy;
      document.write(thisDay + ' ' + day + ' ' + months[month] + ' ' + year);
      //-->
    </script></h4>
    <br>
          
      </div>
      <style>
  strong{
    float: right;
  }
  .judul{
    margin-bottom: 10px;
  } 
  table{
        margin-top: 40px;
        position: center;
    }
  
</style>    

      <table>

  <tr>
    
    <td align="left"><b><h4 class="tulisan">Diterima Oleh,</h4></b></td>
    <td ><b></b></td>
    <td width="600px" align="left"><b></b></td>
    <td align="left"><b><h4 class="tulisan">Dibuat Oleh,</h4></b></td>
    <td><b></b></td>
    <td align="left"><b><h4><u></u></h4></b> </td>
  </tr>
  <tr>
    <td align="left"><b><h4>(_____________)</h4></b></td>
    <td><b></b></td>
    <td width="600px" align="left"><b></b></td>
    <td align="left"><b><h4><u><?php echo $data['username']; ?></u></h4></b></td>
    <td><b></b></td>
    <td align="left"><b></b> </td>
  </tr>
  <tr>
    <td align="left"><b><h4>Nama Jelas</h4></b></td>
    <td><b></b></td>
    <td width="600px" align="left"><b></b></td>
    <td align="left"><b><h4><?php echo $data['jabatan']; ?></h4></b></td>
    <td><b></b></td>
    <td align="left"><b></b> </td>
  </tr>
  

              <?php 
                  endwhile;
               ?>
        </div>    
    </div>

</div>
</body>
</html>
<!-- Memanggil fungsi bawaan HTML2PDF -->
