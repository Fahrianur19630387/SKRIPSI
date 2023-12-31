<?php  
	include "../fungsi/koneksi.php";
    include "../fungsi/fungsi.php";
    //mengambil id untuk edit user
	if (isset($_GET['id'])) {
		$id = $_GET['id'];
		$query = mysqli_query($koneksi, "SELECT * FROM user WHERE id_user = $id ");
		if (mysqli_num_rows($query)) {
			while($row2 = mysqli_fetch_assoc($query)):
?>

<section class="content">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2 col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="text-center">Edit Data User</h3>
                </div>                
                <form method="post"  action="edituproses.php" class="form-horizontal" enctype="multipart/form-data">
                    <div class="box-body">
                     <div class="row">
                        <div class="col-md-2">
                            <a href="index.php?p=user" class="btn btn-primary"><i class="fa fa-backward"></i> Kembali</a> 
                        </div>
                        <br><br>
                    </div>     
                    	<input type="hidden" name="id" value="<?= $row2['id_user']; ?>">
                        <div class="form-group ">
                            <label for="username" class="col-sm-offset-1 col-sm-3 control-label">Username</label>
                            <div class="col-sm-4">
                                <input type="text"  required value="<?= $row2['username']; ?>" class="form-control" name="username">
                            </div>
                        </div>

                         <div class="form-group ">
                            <label for="jabatan" class="col-sm-offset-1 col-sm-3 control-label">Jabatan</label>
                            <div class="col-sm-4">
                                <input type="text" value="<?= $row2['jabatan'];  ?>" required  class="form-control" name="jabatan">
                            </div>
                        </div>

                                           
                         <div class="form-group">
                            <label for="jenis_brg" class="col-sm-offset-1 col-sm-3 control-label">Level</label>
                            <div class="col-sm-4">
                                <select id="jenis_brg" required class="form-control" name="level">
                                <option value="">--Pilih Level--</option>
                                    
                                    <option  <?php if($row2['level'] == "Staff_Gudang") echo "selected"; ?>  value="Staff_Gudang">Staff Gudang</option>
                                    <option  <?php if($row2['level'] == "Admin") echo "selected"; ?> value="Admin">Admin</option>
                                    <option  <?php if($row2['level'] == "Manager") echo "selected"; ?> value="Manager">Manager</option>
                                   
                                    
                                </select>
                            </div>
                        </div> 
                        
                        <div class="form-group ">
                            <label for="gambar" class="col-sm-offset-1 col-sm-3 control-label">Gambar</label>
                            <div class="col-sm-4">
                                
                                <input type="file" class="form-control" name="gambar" id="gambar"><br><img src="../galeri/<?= $row2["gambar"];  ?>" width="100">
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" name="update" class="btn btn-primary col-sm-offset-4 " value="Simpan" > 
                            &nbsp;
                            <input type="reset" class="btn btn-danger" value="Batal">                                                                              
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<?php endwhile; } }  ?>