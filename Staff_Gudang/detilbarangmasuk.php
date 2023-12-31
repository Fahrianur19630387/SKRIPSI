<?php  

include "../fungsi/koneksi.php";
include "../fungsi/fungsi.php";

if (isset($_GET['tgl']) && isset($_GET['unit'])) {
    $tgl = $_GET['tgl'];
    $unit = $_GET['unit'];

    $query = mysqli_query($koneksi, "SELECT masuk.tgl_masuk, masuk.id_masuk, masuk.kode_brg, masuk.jumlah, masuk.status, stokbarang.nama_brg, stokbarang.satuan, stokbarang.category FROM masuk INNER JOIN 
        stokbarang ON masuk.kode_brg = stokbarang.kode_brg  WHERE tgl_masuk='$tgl' AND unit='$unit' AND status!=1");
    
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
                <h3 class="text-center">Input Barang Masuk</h3>
                <h3 class="text-center">Username <?php echo $unit; ?></h3>
            </div>                
            <div class="box-body">                   
                <a href="index.php?p=datamasuk" style="margin:10px;" class="btn btn-success"><i class='fa fa-backward'>  Kembali</i></a>
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead  > 
                            <tr>
                                <th>No</th>
                                <th>Kode Barang</th>                                             
                                <th>Nama Barang</th>
                                <th>Satuan</th>
                                <th>Jumlah</th>
                                
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
                                     <td> <?= $row['kode_brg']; ?> </td>    
                                     <td> <?= $row['nama_brg']; ?> </td>
                                     <td> <?= $row['satuan']; ?> </td>                                       
                                     <td> <?= $row['jumlah']; ?> </td>    
                                                                                                                       
                                     <td > <?php
                                     if ($row['status'] == 0){
                                        echo '<span class=text-warning>Data Stok Belum Tersimpan</span>';
                                    } elseif ($row['status'] == 1) {
                                        echo '<span class=text-primary>Telah Masuk Ke Stok Barang</span>';
                                    } else {
                                        echo '<span class=text-danger>Dibatalkan</span>';
                                    }
                                    ?> 
                                </td>  
                                <td>                                            
                                    
                                    <a  href="setujumasuk.php?id=<?= $row['id_masuk']; ?>"><span data-placement='top' data-toggle='tooltip' title='Setujui'><button   class="btn btn-success">Masukan Ke Stok Barang</button></span></a>            
                                    
                                    
                                    
                                    
                                </td>                                                         
                            </tr>
                            
                            <?php $no++; endwhile; }else {echo "<tr><td colspan=9>Tidak ada Data.</td></tr>";} ?>
                        </tbody>
                    </table>
                </div>                  
            </div>
        </div>
    </div>
</div>
</section>

