 function check() { //사용자가 입력폼에 입력한 상황을 체크
		
		var check = document.reservationForm;

		if (!check.book_id_email.value) {
			alert("아이디를 입력하세요");
			check.book_id_email.focus();
			return false;
		}

		else if (!check.book_name.value) {
			alert("이름을 입력하세요");
			check.book_name.focus();
			return false;
		}

		else if (!check.book_tel.value) {
			alert("전화번호를 입력하세요");
			check.book_tel.focus();
			return false;
		}

		else if (!check.book_car_num.value) {
			alert("차번호를 입력하세요");
			check.book_car_num.focus();
			return false;
		}

		else if (!check.book_car_kinds.value) {
			alert("차종을 입력하세요");
			check.book_kinds.focus();
			return false;
		}

		else if (!check.book_position.value) {
			alert("예약위치를 입력하세요");
			check.book_posion.focus();
			return false;
		}
		
		else if (!check.book_seat.value) {
			alert("예약좌석을 입력하세요");
			check.book_seat.focus();
			return false;
		}

		else if (!check.book_start_date.value) {
			alert("예약 시작 날짜를 선택하세요");
			check.book_start_date.focus();
			return false;
		}

		else if (!check.book_start_time.value) {
			alert("예약 시작 시간을 선택하세요");
			check.book_start_time.focus();
			return false;

		} else if (!check.book_end_date.value) {
			alert("예약 종료 날짜를 선택하세요");
			check.book_end_date.focus();
			return false;
		}

		else if (!check.book_end_time.value) {
			alert("예약 종료 시간을 선택하세요");
			check.book_end_time.focus();
			return false;
		} else {

			 return "/confirmation.jsp";
			

		}
	}  

