<div class="content-wrapper">
    <section class="content">
        <div class="row">
            <!-- left column -->
            <div class="col-md-12">
                <a href="<?= SITE_URL;?>/excel/export" class="btn btn-info">Excel Olarak İndir</a>
                <a href="<?= SITE_URL;?>/excel/importForm" class="btn btn-danger">Excel Olarak Yükle</a>
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Ürün Listesi</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Ad</th>
                                <th>Kategori</th>
                                <th>Düzenle</th>
                                <th>Kaldır</th>
                            </tr>
                            <?php
                            if (count($params['data']) != 0)
                            {
                                foreach ($params['data'] as $key => $value)
                                {
                                    $categoryInfo = $this->model('categoryModel')->getData($value['kategoriId']);
                                    ?>
                                    <tr>
                                        <td><?= $value['id'];?></td>
                                        <td><?= $value['ad'];?></td>
                                        <td><?= $categoryInfo['ad'];?></td>
                                        <td><a href="<?=SITE_URL;?>/urunler/edit/<?= $value['id'];?>">Düzenle</a></td>
                                        <td><a href="<?=SITE_URL;?>/urunler/delete/<?= $value['id'];?>">Sil</a></td>
                                    </tr>
                                    <?php
                                }
                            }
                            ?>

                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
</div>
