<?php
$title = "Trang chủ";
include_once 'header.php';
?>
<div class="container">
    <div class="buttons">
        <a class="button is-primary is-outlined" href="/Choi/index/<?= generateRandomString() ?>">
            <span class="icon-text">
                <span class="icon">
                    <i class="fas fa-plus"></i>
                </span>
                <span>Tạo phòng mới</span>
            </span>
        </a>
    </div>
</div>
<?php include_once 'footer.php'; ?>