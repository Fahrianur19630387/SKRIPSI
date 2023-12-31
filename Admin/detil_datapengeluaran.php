
<?php  
include "../fungsi/koneksi.php";
include "../fungsi/fungsi.php";

if (isset($_GET['tgl']) && isset($_GET['unit'])) {
    $tgl = $_GET['tgl'];
    $unit = $_GET['unit'];
    

    $query = mysqli_query($koneksi, "SELECT permintaan.tgl_permintaan, permintaan.id_permintaan, permintaan.kode_brg, nama_brg, jumlah, satuan, status FROM permintaan INNER JOIN 
        stokbarang ON permintaan.kode_brg = stokbarang.kode_brg  WHERE tgl_permintaan='$tgl' AND unit='$unit' AND status=1");
    
}
?>

<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-sm-12">
           <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="text-center">Data Pengeluaran Barang  <?php echo $unit; ?></h3>
            </div>    
            <div class="box-body"> 
               <div class="table-responsive">
                <a href="index.php?p=datapengeluaran" style="margin:10px;" class="btn btn-success"><i class='fa fa-backward'>  Kembali</i></a>  
            </div>

            <table class="table table-bordered table-hover text-center" id="datapesanan">
                <thead  > 
                    <tr>
                        <th>No</th> 
                        <th>Tanggal Permintaan</th>
                        <th>Nama Barang</th>
                        <th>Satuan</th>
                        <th>Jumlah</th>                                                           
                        <th>Status</th>     

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <?php 
                        $no =1 ;
                        if (mysqli_num_rows($query)) {
                            while($row=mysqli_fetch_assoc($query)):

                               ?>
                               <td> <?= $no; ?> </td>   
                               <td> <?= tanggal_indo($row['tgl_permintaan']); ?> </td>                                      
                               <td> <?= $row['nama_brg']; ?> </td> 
                               <td> <?= $row['satuan']; ?> </td>                                        
                               <td> <?= $row['jumlah']; ?> </td>
                               <td > <?php
                               if ($row['status'] == 0){
                                echo '<span class=text-warning>Belum Disetujui</span>';
                            } elseif ($row['status'] == 1) {
                                echo '<span class=text-primary>Telah Disetujui</span>';
                            } else {
                                echo '<span class=text-danger>Tidak Disetujui</span>';
                            }
                            ?> 
                        </td>   

                    </tr>


                    <?php $no++; endwhile; }else {echo "<tr><td colspan=9>Tidak ada.</td></tr>";} ?>
                </tbody>

            </table>
        </div>                  
    </div>
</div>
</div>
</div>



</section>


