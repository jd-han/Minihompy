<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<script language="javascript">
<!-- 

var isNav4 = false, isNav5 = false, isIE4 = false
var strSeperator = "/"; 
var vDateType = 3; // 날짜형식
//                1 = mm/dd/yyyy
//                2 = yyyy/dd/mm  
//                3 = dd/mm/yyyy

var vYearType = 4; // 네츠케이프용 2자리 혹은 4자리 연도 표기
var vYearLength = 2; // 사용자 입력 연도 자릿수
var err = 0; // 에러코드 디폴트값


if(navigator.appName == "Netscape") 
{
   if (navigator.appVersion < "5")  
   {
      isNav4 = true;
      isNav5 = false;
        }
   else
   if (navigator.appVersion > "4") 
   {
      isNav4 = false;
      isNav5 = true;
        }
}
else  
{
   isIE4 = true;
}

function DateFormat(vDateName, vDateValue, e, dateCheck, dateType)  {

vDateType = dateType;
   
   if (vDateValue == "~")
   {
      alert("AppVersion = "+navigator.appVersion+" \nNav. 4 Version = "+isNav4+" \nNav. 5 Version = "+isNav5+" \nIE Version = "+isIE4+" \nYear Type = "+vYearType+" \nDate Type = "+vDateType+" \nSeparator = "+strSeperator);
      vDateName.value = "";
      vDateName.focus();
      return true;
   }
      
   var whichCode = (window.Event) ? e.which : e.keyCode;

   if (vDateValue.length > 8 && isNav4)
   {
      if ((vDateValue.indexOf("-") >= 1) || (vDateValue.indexOf("/") >= 1))
         return true;
   }
   
   var alphaCheck = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ/-";
   if (alphaCheck.indexOf(vDateValue) >= 1)  
   {
      if (isNav4)
      {
         vDateName.value = "";
         vDateName.focus();
         vDateName.select();
         return false;
      }
      else
      {
         vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
         return false;
      } 
   }
   if (whichCode == 8)
      return false;
   else 
   {
      var strCheck = '47,48,49,50,51,52,53,54,55,56,57,58,59,95,96,97,98,99,100,101,102,103,104,105';
      if (strCheck.indexOf(whichCode) != -1)  
      {
         if (isNav4)  
         {
            if (((vDateValue.length < 6 && dateCheck) || (vDateValue.length == 7 && dateCheck)) && (vDateValue.length >=1))
            {
               alert("Invalid Date\nPlease Re-Enter");
               vDateName.value = "";
               vDateName.focus();
               vDateName.select();
               return false;
            }
            if (vDateValue.length == 6 && dateCheck)  
            {
               var mDay = vDateName.value.substr(2,2);
               var mMonth = vDateName.value.substr(0,2);
               var mYear = vDateName.value.substr(4,4)
               
               if (mYear.length == 2 && vYearType == 4) 
               {
                  var mToday = new Date();
                  
                  var checkYear = mToday.getFullYear() + 30; 
                  var mCheckYear = '20' + mYear;
                  if (mCheckYear >= checkYear)
                     mYear = '19' + mYear;
                  else
                     mYear = '20' + mYear;
               }
               var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
               
               if (!dateValid(vDateValueCheck))  
               {
                  alert("Invalid Date\nPlease Re-Enter");
                  vDateName.value = "";
                  vDateName.focus();
                  vDateName.select();
                  return false;
                         }
               return true;
            
            }
            else
            {
               
               if (vDateValue.length >= 8  && dateCheck)  
               {
                  if (vDateType == 1) // mmddyyyy
                  {
                     var mDay = vDateName.value.substr(2,2);
                     var mMonth = vDateName.value.substr(0,2);
                     var mYear = vDateName.value.substr(4,4)
                     vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
                  }
                  if (vDateType == 2) // yyyymmdd
                  {
                     var mYear = vDateName.value.substr(0,4)
                     var mMonth = vDateName.value.substr(4,2);
                     var mDay = vDateName.value.substr(6,2);
                     vDateName.value = mYear+strSeperator+mMonth+strSeperator+mDay;
                  }
                  if (vDateType == 3) // ddmmyyyy
                  {
                     var mMonth = vDateName.value.substr(2,2);
                     var mDay = vDateName.value.substr(0,2);
                     var mYear = vDateName.value.substr(4,4)
                     vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;
                  }
                  
                  var vDateTypeTemp = vDateType;
                  vDateType = 1;
                  var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
                  
                  if (!dateValid(vDateValueCheck))  
                  {
                     alert("Invalid Date\nPlease Re-Enter");
                     vDateType = vDateTypeTemp;
                     vDateName.value = "";
                     vDateName.focus();
                     vDateName.select();
                     return false;
                            }
                     vDateType = vDateTypeTemp;
                     return true;
                    }
               else
               {
                  if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1))
                  {
                     alert("Invalid Date\nPlease Re-Enter");
                     vDateName.value = "";
                     vDateName.focus();
                     vDateName.select();
                     return false;
                  }
               }
            }
         }
         else  
         {
            if (((vDateValue.length < 8 && dateCheck) || (vDateValue.length == 9 && dateCheck)) && (vDateValue.length >=1))
            {
               alert("Invalid Date\nPlease Re-Enter");
               vDateName.value = "";
               vDateName.focus();
               return true;
            }
            
            if (vDateValue.length >= 8 && dateCheck)  
            {
            
              
               if (vDateType == 1) // mm/dd/yyyy
               {
                  var mMonth = vDateName.value.substr(0,2);
                  var mDay = vDateName.value.substr(3,2);
                  var mYear = vDateName.value.substr(6,4)
               }
               if (vDateType == 2) // yyyy/mm/dd
               {
                  var mYear = vDateName.value.substr(0,4)
                  var mMonth = vDateName.value.substr(5,2);
                  var mDay = vDateName.value.substr(8,2);
               }
               if (vDateType == 3) // dd/mm/yyyy
               {
                  var mDay = vDateName.value.substr(0,2);
                  var mMonth = vDateName.value.substr(3,2);
                  var mYear = vDateName.value.substr(6,4)
               }
               if (vYearLength == 4)
               {
                  if (mYear.length < 4)
                  {
                     alert("Invalid Date\nPlease Re-Enter");
                     vDateName.value = "";
                     vDateName.focus();
                     return true;
                  }
               }
               
              var vDateTypeTemp = vDateType;
               
               vDateType = 1;
               
               var vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
               
               if (mYear.length == 2 && vYearType == 4 && dateCheck)  
               {
                  
                  var mToday = new Date();
                  
                  var checkYear = mToday.getFullYear() + 30; 
                  var mCheckYear = '20' + mYear;
                  if (mCheckYear >= checkYear)
                     mYear = '19' + mYear;
                  else
                     mYear = '20' + mYear;
                  vDateValueCheck = mMonth+strSeperator+mDay+strSeperator+mYear;
                  
                  if (vDateTypeTemp == 1) // mm/dd/yyyy
                     vDateName.value = mMonth+strSeperator+mDay+strSeperator+mYear;
                  if (vDateTypeTemp == 3) // dd/mm/yyyy
                     vDateName.value = mDay+strSeperator+mMonth+strSeperator+mYear;

               } 
               
               
               if (!dateValid(vDateValueCheck))  
               {
                  alert("Invalid Date\nPlease Re-Enter");
                  vDateType = vDateTypeTemp;
                  vDateName.value = "";
                  vDateName.focus();
                  return true;
                         }
               vDateType = vDateTypeTemp;
               return true;
            
            }
            else
            {
               
               if (vDateType == 1)
               {
                  if (vDateValue.length == 2)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
                  if (vDateValue.length == 5)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
               }
               if (vDateType == 2)
               {
                  if (vDateValue.length == 4)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
                  if (vDateValue.length == 7)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
               } 
               if (vDateType == 3)
               {
                  if (vDateValue.length == 2)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
                  if (vDateValue.length == 5)  
                  {
                     vDateName.value = vDateValue+strSeperator;
                  }
               }
               return true;
            }
         }
         if (vDateValue.length == 10   && dateCheck)  
         {
            if (!dateValid(vDateName))  
            {
               alert("Invalid Date\nPlease Re-Enter");
               vDateName.focus();
               vDateName.select();
                 }
         }
         return false;
      }
      else  
      {
         if (isNav4)
         {
            vDateName.value = "";
            vDateName.focus();
            vDateName.select();
            return false;
         }
         else
         {
            vDateName.value = vDateName.value.substr(0, (vDateValue.length-1));
            return false;
         }
                }
        }
}


   function dateValid(objName) {
      var strDate;
      var strDateArray;
      var strDay;
      var strMonth;
      var strYear;
      var intday;
      var intMonth;
      var intYear;
      var booFound = false;
      var datefield = objName;
      var strSeparatorArray = new Array("-"," ","/",".");
      var intElementNr;
      // var err = 0;
      var strMonthArray = new Array(12);
      strMonthArray[0] = "Jan";
      strMonthArray[1] = "Feb";
      strMonthArray[2] = "Mar";
      strMonthArray[3] = "Apr";
      strMonthArray[4] = "May";
      strMonthArray[5] = "Jun";
      strMonthArray[6] = "Jul";
      strMonthArray[7] = "Aug";
      strMonthArray[8] = "Sep";
      strMonthArray[9] = "Oct";
      strMonthArray[10] = "Nov";
      strMonthArray[11] = "Dec";
      
      //strDate = datefield.value;
      strDate = objName;
      
      if (strDate.length < 1) {
         return true;
      }
      for (intElementNr = 0; intElementNr < strSeparatorArray.length; intElementNr++) {
         if (strDate.indexOf(strSeparatorArray[intElementNr]) != -1) 
         {
            strDateArray = strDate.split(strSeparatorArray[intElementNr]);
            if (strDateArray.length != 3) 
            {
               err = 1;
               return false;
            }
            else 
            {
               strDay = strDateArray[0];
               strMonth = strDateArray[1];
               strYear = strDateArray[2];
            }
            booFound = true;
         }
      }
      if (booFound == false) {
         if (strDate.length>5) {
            strDay = strDate.substr(0, 2);
            strMonth = strDate.substr(2, 2);
            strYear = strDate.substr(4);
         }
      }
      //Adjustment for short years entered
      if (strYear.length == 2) {
         strYear = '20' + strYear;
      }
      strTemp = strDay;
      strDay = strMonth;
      strMonth = strTemp;
      intday = parseInt(strDay, 10);
      if (isNaN(intday)) {
         err = 2;
         return false;
      }
      
      intMonth = parseInt(strMonth, 10);
      if (isNaN(intMonth)) {
         for (i = 0;i<12;i++) {
            if (strMonth.toUpperCase() == strMonthArray[i].toUpperCase()) {
               intMonth = i+1;
               strMonth = strMonthArray[i];
               i = 12;
            }
         }
         if (isNaN(intMonth)) {
            err = 3;
            return false;
         }
      }
      intYear = parseInt(strYear, 10);
      if (isNaN(intYear)) {
         err = 4;
         return false;
      }
      if (intMonth>12 || intMonth<1) {
         err = 5;
         return false;
      }
      if ((intMonth == 1 || intMonth == 3 || intMonth == 5 || intMonth == 7 || intMonth == 8 || intMonth == 10 || intMonth == 12) && (intday > 31 || intday < 1)) {
         err = 6;
         return false;
      }
      if ((intMonth == 4 || intMonth == 6 || intMonth == 9 || intMonth == 11) && (intday > 30 || intday < 1)) {
         err = 7;
         return false;
      }
      if (intMonth == 2) {
         if (intday < 1) {
            err = 8;
            return false;
         }
         if (LeapYear(intYear) == true) {
            if (intday > 29) {
               err = 9;
               return false;
            }
         }
         else {
            if (intday > 28) {
               err = 10;
               return false;
            }
         }
      }
         return true;
      }

   function LeapYear(intYear) {
      if (intYear % 100 == 0) {
         if (intYear % 400 == 0) { return true; }
      }
      else {
         if ((intYear % 4) == 0) { return true; }
      }
         return false;
      }
//  End -->
</script>


</HEAD>

<!-- 2. BODY 태그안에 아래와 같이 함수를 복사해 넣으세요 -->
<BODY BGCOLOR="#CCFF99" onLoad="document.dateTest.testDateFormat1.focus()">

<!-- 3. 아래와 같은 방법으로 BODY 부분에 스크립트를 입력하세요 -->
<form name='dateTest'>
      <table border = '0' width='400'  align=center>
      <tr>
         <td>
            <table align='center' border='1' width='400'>
               <tr>
                  <td  bgcolor='orange' width='75%' align=center>
                     <font color='black'><B>mm/dd/yyyy 형식</B></font>
                  </td>
                  <td>
                     <input type="text" name="testDateFormat1" size='10' maxlength="10" onFocus="javascript:vDateType='1'" onKeyUp="DateFormat(this,this.value,event,false,'1')" onBlur="DateFormat(this,this.value,event,true,'1')">
                  </td>
               </tr>
            </table>
         </td>
       </tr>
       <tr>
         <td>
            <table align='center' border='1' width='400'>
               <tr>
                  <td  bgcolor='orange' width='75%' align=center>
                     <font color='black'><B>yyyy/mm/dd 형식</B></font>
                  </td>
                  <td>
                     <input type="text" name="testDateFormat3" size='10' maxlength="10" onFocus="javascript:vDateType='2'" onKeyUp="DateFormat(this,this.value,event,false,'2')" onBlur="DateFormat(this,this.value,event,true,'2')">
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      <tr>
         <td>
            <table align='center' border='1' width='400'>
               <tr>
                  <td  bgcolor='orange' width='75%' align=center>
                     <font color='black'><B>dd/mm/yyyy 형식</B></font>
                  </td>
                  <td>
                     <input type="text" name="testDateFormat5" size='10' maxlength="10" onFocus="javascript:vDateType='3'" onKeyUp="DateFormat(this,this.value,event,false,'3')" onBlur="DateFormat(this,this.value,event,true,'3')">
                  </td>
               </tr>
            </table>
         </td>
      </tr>
      </table>
               
   </form>

</body>
</html>