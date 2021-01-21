<?php

include_once 'header.php'; ?>
<script>
    var room = "<?= $room ?>";
</script>
<div class="container is-max-desktop" id="app">
    <div class="content-chapter">
        <center><img :src="newQRCode" alt="QRCode" /></center>
        <br />
        <?php
        $session = \Config\Services::session();
        if ($session->id > 0 && $session->room == $room) {
            echo "Xin chào $session->username";
        ?>
            <br />
            <button v-for="item in items" :key="item.username" class="button is-primary is-rounded" style="margin-left: 5px;">
                <span class="icon">
                    <i class="fas fa-user"></i>
                </span>
                <span>{{ item.username }}</span>
            </button>
            <hr />
            Vai trò của bạn là: <b>{{myrole}}</b>
            <?php
            if ($session->isadmin) {
            ?>
                <hr />
                <input type="checkbox" id="tientri" value="tientri" v-model="checkedRole">
                <label for="tientri">Tiên tri</label>
                <input type="checkbox" id="baove" value="baove" v-model="checkedRole">
                <label for="baove">Bảo vệ</label>
                <input type="checkbox" id="thosan" value="thosan" v-model="checkedRole">
                <label for="thosan">Thợ săn</label>
                <input type="checkbox" id="phuthuy" value="phuthuy" v-model="checkedRole">
                <label for="phuthuy">Phù thủy</label>
                <br />
                <button v-on:click="generateGame" class="button is-success">Tạo game</button>
            <?php
            }
        } else {
            ?>
            <form v-on:submit.prevent="doLogin" id="form">
                <div class=" field">
                    <p class="control has-icons-left has-icons-right">
                        <input class="input" v-bind:class="{'is-danger': warning.username.status == -1, 'is-success': warning.username.status == 1}" type="text" placeholder="Tên/Biệt danh" v-model="user.username">
                        <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                        </span>
                        <span class="icon is-small is-right">
                            <i class="fas fa-check" v-if="warning.username.status == 1"></i>
                            <i class=" fas fa-exclamation-triangle" v-if="warning.username.status == -1"></i>
                        </span>
                    </p>
                    <p class=" help is-danger" v-if="warning.username.status == -1">{{warning.username.text}}
                    </p>
                </div>
                <div class="field">
                    <p class="control">
                        <button class="button is-success" type="submit">
                            Chơi ngay
                        </button>
                    </p>
                </div>
            </form>
        <?php } ?>
    </div>
</div>
<?php include_once 'footer.php'; ?>