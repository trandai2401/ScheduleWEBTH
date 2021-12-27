function openStaticNavigation() {
    $.ajax({
        method: "GET",
        url: "layout-static.html",

        // data: { name: "John", location: "Boston" }
    })
        .done(function (msg) {
            var layout_new;
            layout_new = document.getElementById('layoutSidenav_content');
            layout_new.innerHTML = msg;
            console.log(msg);
        })
}

const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
];

const weekdays = ["Cn", "T2", "T3", "T4", "T5", "T6", "T7"];



// biến chính
let date = new Date();

// Hàm trả về ngày lịch hiện tại
function getCurrentDate(element, asString) {
    if (element) {
        if (asString) {
            return element.textContent = weekdays[date.getDay()] + ', ' + date.getDate() + " de " + months[date.getMonth()] + " de " + date.getFullYear();
        }
        return element.value = date.toISOString().substr(0, 10);
    }
    return date;
}


// Chức năng chính tạo lịch
function generateCalendar() {

    // Nhận một lịch và nếu nó đã tồn tại, hãy xóa nó
    const calendar = document.getElementById('calendar');
    if (calendar) {
        calendar.remove();
    }

    // Tạo bảng lưu trữ ngày tháng
    const table = document.createElement("table");
    table.id = "calendar";

    // Tạo tiêu đề đề cập đến các ngày trong tuần
    const trHeader = document.createElement('tr');
    trHeader.className = '  ';
    weekdays.map(week => {
        const th = document.createElement('th');
        const w = document.createTextNode(week.substring(0, 3));
        th.appendChild(w);
        trHeader.appendChild(th);
    });

    // Thêm tiêu đề vào bảng
    table.appendChild(trHeader);

    //Nhận ngày trong tuần từ ngày đầu tiên của tháng
    const weekDay = new Date(
        date.getFullYear(),
        date.getMonth(),
        1
    ).getDay();

    //Nhận ngày cuối cùng của tháng
    const lastDay = new Date(
        date.getFullYear(),
        date.getMonth() + 1,
        0
    ).getDate();

    let tr = document.createElement("tr");
    let td = '';
    let empty = '';
    let btn = document.createElement('button');
    let week = 0;

    // Nếu ngày trong tuần của ngày đầu tiên của tháng lớn hơn 0 (ngày đầu tiên của tuần);
    while (week < weekDay) {
        td = document.createElement("td");
        empty = document.createTextNode(' ');
        td.appendChild(empty);
        tr.appendChild(td);
        week++;
    }

    // Nó sẽ chạy từ ngày 1 đến ngày cuối cùng của tháng
    for (let i = 1; i <= lastDay;) {
        // Miễn là ngày trong tuần <7, nó sẽ thêm cột vào hàng tuần.
        while (week < 7) {
            td = document.createElement('td');
            let text = document.createTextNode(i);
            btn = document.createElement('button');
            btn.className = "btn-day";
            btn.addEventListener('click', function () { changeDate(this) });
            week++;



            // Kiểm soát để nó dừng lại chính xác vào ngày cuối cùng
            if (i <= lastDay) {
                i++;
                btn.appendChild(text);
                td.appendChild(btn)
            } else {
                text = document.createTextNode(' ');
                td.appendChild(text);
            }
            tr.appendChild(td);
        }
        // Thêm hàng vào bảng
        table.appendChild(tr);

        // Tạo một dòng mới để sử dụng
        tr = document.createElement("tr");

        // Đặt lại bộ đếm các ngày trong tuần
        week = 0;
    }
    // Thêm bảng vào div mà nó phải thuộc về
    const content = document.getElementById('table');
    content.appendChild(table);
    changeActive();
    changeHeader(date);
    document.getElementById('date').textContent = date;
    getCurrentDate(document.getElementById("currentDate"), true);
    getCurrentDate(document.getElementById("date"), false);
}

// Thay đổi ngày bằng biểu mẫu
function setDate(form) {
    let newDate = new Date(form.date.value);
    date = new Date(newDate.getFullYear(), newDate.getMonth(), newDate.getDate() + 1);
    generateCalendar();
    return false;
}

// Phương pháp Thay đổi tháng và năm ở đầu lịch
function changeHeader(dateHeader) {
    const month = document.getElementById("month-header");
    if (month.childNodes[0]) {
        month.removeChild(month.childNodes[0]);
    }
    const headerMonth = document.createElement("h6");
    const textMonth = document.createTextNode(months[dateHeader.getMonth()].substring(0, 3) + " " + dateHeader.getFullYear());
    headerMonth.appendChild(textMonth);
    month.appendChild(headerMonth);
}

// Chức năng thay đổi màu của nút trong ngày đang hoạt động
function changeActive() {
    let btnList = document.querySelectorAll('button.active');
    btnList.forEach(btn => {
        btn.classList.remove('active');
    });
    btnList = document.getElementsByClassName('btn-day');
    for (let i = 0; i < btnList.length; i++) {
        const btn = btnList[i];
        if (btn.textContent === (date.getDate()).toString()) {
            btn.classList.add('active');
        }
    }
}

// Hàm lấy ngày hiện tại
function resetDate() {
    date = new Date();
    generateCalendar();
}

// Thay đổi ngày theo số lượng nút được nhấp
function changeDate(button) {
    removeAllCardCongViec()
    let newDay = parseInt(button.textContent);
    date = new Date(date.getFullYear(), date.getMonth(), newDay);
    console.log(date);
    generateCalendar();
    var dateDisplay = new Date(date.getFullYear(), date.getMonth(), newDay);

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() - (dateDisplay.getDay() - 1));
    console.log("Thứ 2 là ngày: " + dateDisplay.getDate());
    var ngaythu2 = document.getElementById("ngayt2");
    var thangThu2 = document.getElementById("thang_thu2");
    thangThu2.innerText = dateDisplay.getMonth() + 1;
    ngaythu2.innerText = dateDisplay.getDate();

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() + 1);
    console.log("Thứ 3 là ngày: " + dateDisplay.getDate());
    var ngaythu3 = document.getElementById("ngayt3");
    var thangThu3 = document.getElementById("thang_thu3");
    thangThu3.innerText = dateDisplay.getMonth() + 1;
    ngaythu3.innerText = dateDisplay.getDate();

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() + 1);
    console.log("Thứ 4 là ngày: " + dateDisplay.getDate());
    var ngaythu4 = document.getElementById("ngayt4");
    var thangThu4 = document.getElementById("thang_thu4");
    thangThu4.innerText = dateDisplay.getMonth() + 1;
    ngaythu4.innerText = dateDisplay.getDate();

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() + 1);
    console.log("Thứ 5 là ngày: " + dateDisplay.getDate());
    var ngaythu4 = document.getElementById("ngayt5");
    var thangThu5 = document.getElementById("thang_thu5");
    thangThu5.innerText = dateDisplay.getMonth() + 1;
    ngaythu4.innerText = dateDisplay.getDate();

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() + 1);
    console.log("Thứ 6 là ngày: " + dateDisplay.getDate());
    var ngaythu6 = document.getElementById("ngayt6");
    var thangThu6 = document.getElementById("thang_thu6");
    thangThu6.innerText = dateDisplay.getMonth() + 1;
    ngaythu6.innerText = dateDisplay.getDate();

    dateDisplay = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() + 1);
    console.log("Thứ 7 là ngày: " + dateDisplay.getDate());
    var ngaythu7 = document.getElementById("ngayt7");
    var thangThu7 = document.getElementById("thang_thu7");
    thangThu7.innerText = dateDisplay.getMonth() + 1;
    ngaythu7.innerText = date.getDate();
    var dateStart = new Date(dateDisplay.getFullYear(), dateDisplay.getMonth(), dateDisplay.getDate() - 5);

    console.log("" + dateStart.getFullYear() + "/" + (dateStart.getMonth() + 1) + "/" + (dateStart.getDate()))
    console.log(dateDisplay.getFullYear() + "/" + (dateDisplay.getMonth() + 1) + "/" + (dateDisplay.getDate()))

    callApiGetAllCongViec(dateStart.getFullYear() + "/" + (dateStart.getMonth() + 1) + "/" + (dateStart.getDate()), dateDisplay.getFullYear() + "/" + (dateDisplay.getMonth() + 1) + "/" + (dateDisplay.getDate()));

    // console.log(date);
}

function removeAllCardCongViec() {
    var allCartCongViec = document.getElementsByClassName('class_card_congviec');
    // var lenarr = allCartCongViec.length;
    for (let i = 0; allCartCongViec.length != 0;) {
        console.log(i)
        allCartCongViec[i].remove();
    }
}

function dislayCardCongViec(result) {
    for (let item of result) {
        let gio = parseInt(item.giobatdau.substring(0, 2));
        let gioKetThuc = parseInt(item.gioketthuc.substring(0, 2));
        let d = new Date(item.ngay);

        createCardCongViec(
            item.id,
            item.tieude,
            d.getDay() + 1,
            gio,
            gioKetThuc - gio,
            item.color)
    }

}
function createCardCongViec(id, tieuDe, thu, gio, thoiGianKeoDai, mauSac) {
    var div = document.createElement("div");
    div.id = "id_card_congviec" + id;
    div.className = "class_card_congviec";
    div.onclick = function () {
        callApigetCongViecById(id)

    };
    div.innerText = tieuDe;
    // input mau
    div.style.display = "block";
    div.style.position = "absolute";
    div.style.width = "100%";
    console.log(thoiGianKeoDai);
    div.style.height = (thoiGianKeoDai * 50) + "px";
    div.style.background = mauSac;
    div.style.color = "white";
    console.log(tieuDe.value);
    var demo = document.getElementById(
        "thu" + thu + "_" + gio + "h"
    );
    demo.appendChild(div);

    function deleteFormChiTiet() {
        div.remove();
    }
    closeFormAddEvent();
}


function callApigetCongViecById(id) {
    console.log(id)
    var form = new FormData();
    form.append('_token', '{{ csrf_token() }}');

    $.ajax({
        method: 'get',
        url: "http://localhost/ScheduleWEBTH/public/user/schedule/" + id,
        context: document.body,
        data: form,
        contentType: false,
        processData: false

        // {
        //     _token: "{{ csrf_token() }}",
        //     images: imagefile
        // }
    }).done(function (result) {
        console.log(result);

        var tieudecongviec_label = document.getElementById('tieudecongviec_label');
        var thoigianbatdau_label = document.getElementById('thoigianbatdau_label');
        var thoigianketthuc_label = document.getElementById('thoigianketthuc_label');
        var noidungcongviec_label = document.getElementById('noidungcongviec_label');

        tieudecongviec_label.innerText = result.tieude;

        thoigianbatdau_label.innerText = parseInt(result.giobatdau.substring(0, 2)) + " giờ";
        thoigianketthuc_label.innerText = parseInt(result.gioketthuc.substring(0, 2)) + " giờ";
        noidungcongviec_label.innerHTML = result.noidung;

        let btn_delete_event = document.getElementById('btn_delete_event');
        btn_delete_event.onclick = function () {
            console.log('hihi')
            callApiDeleteCongViec(result.id);
        }



        var formEvent = document.getElementById("showEventCalendar");
        formEvent.style.display = "block";
    }).fail(function (result) {
        console.log(result);
    })
}

function callApiGetAllCongViec(ngayBatDau, ngayKetThuc) {
    var form = new FormData();
    // form.append('_token', '{{ csrf_token() }}');
    form.append('ngayBatDau', ngayBatDau);
    form.append('ngayKetThuc', ngayKetThuc);

    $.ajax({
        method: 'get',
        url: "http://localhost/ScheduleWEBTH/public/user/schedule?ngayBatDau=" + ngayBatDau + "&ngayKetThuc=" + ngayKetThuc,
        context: document.body,
        data: form,
        contentType: false,
        processData: false

        // {
        //     _token: "{{ csrf_token() }}",
        //     images: imagefile
        // }
    }).done(function (result) {
        console.log(result);
        dislayCardCongViec(result);
        // var d = new Date(result.ngay.replaceAll("-", "/"));
        // console.log(gioketThuc - gioBatDau);

        // var res = JSON.parse(result);
        // thongBao("alert-success", "Đã thêm " + res.soLuongThayDoi + " nông sản này vào giỏ hàng");
    }).fail(function (result) {
        console.log(result);
    })

}


// các chức năng tiến và lùi tháng và ngày
function nextMonth() {
    date = new Date(date.getFullYear(), date.getMonth() + 1, 2);
    generateCalendar(date);
}

function prevMonth() {
    date = new Date(date.getFullYear(), date.getMonth() - 1, 12);
    generateCalendar(date);
}


function prevDay() {
    date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - 1);
    generateCalendar();
}

function nextDay() {
    date = new Date(date.getFullYear(), date.getMonth(), date.getDate() + 1);
    generateCalendar();
}

document.onload = generateCalendar(date);

