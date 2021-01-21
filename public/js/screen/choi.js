var app = new Vue({
    el: '#app',
    data: {
        checkedRole: [],
        myrole: "Chưa nhận",
        items: [],
        user: {
            username: null,
            room: null
        },
        valid: {
            username: /^\w{3,15}$/
        },
        warning: {
            username: {
                status: 0,
                text: ""
            }
        },
        qrcode: new QRious({ size: 200 })
    },
    created: function() {
        var self = this;
        setInterval(function() {
            var data = { room: room };
            axios.post('/ping', null, { params: data }).then(function(response) {
                self.items = response.data;
            }).catch(function(error) {
                console.log(error);
            });

            axios.post('/getrole', null, { params: data }).then(function(response) {
                self.myrole = response.data;
            }).catch(function(error) {
                console.log(error);
            });

        }, 2000);
    },
    computed: {
        newQRCode() {
            this.qrcode.value = window.location.href;
            return this.qrcode.toDataURL();
        },
    },
    methods: {
        generateGame: function() {
            var self = this;
            var data = { room: room, roles: this.checkedRole };

            axios.post('/generate', null, { params: data }).then(function(response) {
                console.log(response.data);
            }).catch(function(error) {
                console.log(error);
            });
        },
        doLogin: function() {
            var self = this;
            // check account
            this.user.room = room; //localStorage.getItem("room");
            if (this.user.username == null || this.user.username == '') {
                this.warning.username.status = -1;
                this.warning.username.text = "Tên/Biệt danh không được để trống";
            } else if (!this.valid.username.test(this.user.username)) {
                this.warning.username.status = -1;
                this.warning.username.text = "Tên/Biệt danh là chữ hoặc số từ 3-15 ký tự";
            } else {
                axios.post('/login', null, { params: this.user }).then(function(response) {
                    //đăng nhập thành công
                    location.reload();
                }).catch(function(error) {
                    console.log(error);
                });
            }

        }
    }
});