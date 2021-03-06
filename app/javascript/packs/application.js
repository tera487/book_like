// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"


Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 作成したファイルをwebpackerに読み込ませます。

import "../js/hoge.js";
import "../js/page_top";
import "../js/password_form";
import "../js/admin_password_form";
import "../js/count";
import "../js/drawer.js";
// import 'bootstrap/dist/css/bootstrap.min.css';

window.$ = jQuery;