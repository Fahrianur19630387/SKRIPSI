<?php  
include "../fungsi/koneksi.php";
include "../fungsi/fungsi.php";

if (isset($_GET['tgl']) && isset($_GET['unit'])) {
    $tgl = $_GET['tgl'];
    $unit = $_GET['unit'];


   $query = mysqli_query($koneksi, "SELECT * FROM pemeliharaan WHERE tgl_pemeliharaan='$tgl' AND unit='$unit' AND status!=1");   
    
   

}
if (isset($_GET['aksi'])) {
    if ($_GET['aksi'] == 'edit')
        header("location:?p=editpesan");        
}

?>
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-sm-12">
         <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="text-center">Konfirmasi pemeliharaan  <?php echo $unit; ?></h3>
            </div>                
            <div class="box-body">                   
                <a href="index.php?p=data_permintaan_pemeliharaan_barang" style="margin:10px;" class="btn btn-success"><i class='fa fa-backward'>  Kembali</i></a>
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead  > 
                            <tr>
                                <th>No</th>
                                <th>Kode Barang</th>                                             
                                <th>Nama Barang</th>
                                <th>Jumlah</th>
                              
                                <th>Nama Karyawan</th>
                                <th>Status</th>                                                                       
                                <th>Aksi</th>
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
                                     <td> <?= $row['no_service']; ?> </td>    
                                     <td> <?= $row['nama_brg']; ?> </td>                                      
                                     <td> <?= $row['jumlah']; ?> </td>
                                     
                                     <td> <?= $row['unit']; ?> </td>                                                                                     
                                     <td > <?php
                                     if ($row['status'] == 0){
                                        echo '<span class=text-warning>Menunggu Persetujuan</span>';
                                    } elseif ($row['status'] == 1) {
                                        echo '<span class=text-primary>Telah Disetujui</span>';
                                    } else {
                                        echo '<span class=text-danger>Tidak Disetujui</span>';
                                    }
                                    ?> 
                                </td>  
                                <td>                                            

                                    <a  href="setuju_pemeliharaan.php?id=<?= $row['no_service']; ?>"><span data-placement='top' data-toggle='tooltip' title='Setujui'><button   class="btn btn-success">Setujui</button></span></a>            
                                    
                                    <a  href="tidaksetuju_pemeliharaan.php?tgl=<?= $tgl; ?>&unit=<?= $unit; ?>&id=<?=$row['no_service']; ?>"><span data-placement='top' data-toggle='tooltip' title='Tidak Setuju'><button   class="btn btn-danger" >Tidak Setuju</button></span></a>            
                                    
                                    
                                    
                                </td>                                                         
                            </tr>
                            
                            <?php $no++; endwhile; }else {echo "<tr><td colspan=9>Tidak ada pemeliharaan material teknik.</td></tr>";} ?>
                        </tbody>
                    </table>
                </div>                  
            </div>
        </div>
    </div>
</div>
</section>

