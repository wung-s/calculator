$(document).ready(function() {

var nrows;
  $('#btn_container').hide();
  $('#result_container').hide(); 

  $('#selRow').change(function() {

     $('#tblebody').find('tr:gt(0)').remove(); 

     nrows = $('#selRow option:selected').val(); 
     var rws; 
     console.log('no of rows: ' + nrows); 
     rws = '<tr>'; 
     for(i = 1; i<= nrows; i++ )  {
        rws += "<tr>"; 
        rws += "<td>" + i + "</td>";
        rws += "<td><input id ='sub" + i + "_int" + "' type='number' class = 'form-control' min='0' max='50'/></td>";
        rws += "<td><input id ='sub" + i + "_ext" + "' type='number' class = 'form-control' min='0' max='60'/></td>";
        rws += "<td><input id ='sub" + i + "_creditHrs" + "' type='number' class = 'form-control' min='0' max='4' /></td>";
        rws += "<td><input id ='sub" + i + "_total" + "' type='text' class = 'form-control' readonly/></td>";
        rws += "<td><input id ='sub" + i + "_grade" + "' type='text' class = 'form-control' readonly/></td>";
        rws += "<td><input id ='sub" + i + "_creditPts" + "' type='text' class = 'form-control' readonly/></td>"
        rws += "</tr>";    
     }
  
     rws += '</tr>'; 
     $('#tblebody').append(rws); 
   
     if(nrows > 0) 
       $('#btn_container').show(); 
     else
       $('#btn_container').hide(); 

  }); 

  //calculation of result
  var intMarks; 
  var extMarks;
  var creditPoints; 
  var creditHrs;
  var total;
  var grade; 
  var gradePoint;

  $('#btn_calculate').click(function() {
      $('#result_container').show(); 
      for(i=1; i<=nrows; i++) {
          intMarks = parseInt($('#sub'+i + '_int').val());
          extMarks = parseInt($('#sub' +i + '_ext').val()); 
          creditHrs = parseInt($('#sub' + i + '_creditHrs').val()); 
          total = intMarks + extMarks; 
          
          if(total >= 70) {
              grade = 'O'; 
              gradePoint = 7;
          } else if (total >=60) {
            grade = 'A'; 
            gradePoint = 6;
          } else if (total >= 55) {
            grade = 'B'; 
            gradePoint = 5;
          } else if (total >= 50) {
            grade = 'C'; 
            gradePoint = 4;
          } else if (total >= 45) {
            grade = 'D'; 
            gradePoint = 3;
          } else if (total >=40) {
            grade = 'E'; 
            gradePoint = 2;
          } else  {
            grade = 'F';
            gradePoint = 0;
          }
            
          console.log('grade is: ' + grade); 
          creditPoints = creditHrs;
          $('#sub' + i + '_total').val(total); 
          $('#sub' + i + '_grade').val(grade); 
          
          $('#sub' + i + '_creditPts').val(creditHrs * gradePoint); 


      }
      var sumCreditPts = 0; 
      var sumCreditHrs = 0;
      for(i=1; i<=nrows; i++) {
          sumCreditPts += parseInt($('#sub' + i + '_creditPts').val()); 
          sumCreditHrs += parseInt($('#sub' + i + '_creditHrs').val()); 
 
      }

      $('#res_gpa').val(parseFloat(sumCreditPts/sumCreditHrs));
     //   $('#res_gpa').val(3.33);
      
      
  }); 
 
})