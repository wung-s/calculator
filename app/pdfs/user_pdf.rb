# require "prawn"
# require "prawn/table"
class UserPdf < Prawn::Document
	def initialize(user)
		super(top_margin: 70)
		@user = user
		@slno = 001
		@faculty = 'Business Administration'
		@session = 'I & II(2014-2015)'
		@examination = 'Master of Business Administration(MBA)'
		@medium = 'English'
		font_families.update("Old English" => {
 												normal: "OldeEnglish.ttf"}, 
							"English Towne" => {
												normal: "EnglishTowne.tff"})

	#	user_name
	#	move_down 100
	#	grade_report
	#	move_down 20
	#	student_info	
	#	move_down 10
	#	line_items
		# text @user.email.to_s
	#	move_down 20
	#	statement 
		header_info

		move_down 5
		subject_marks
		move_down 8
		show_result 
		
		move_down 10 
		subject_marks
		move_down 8
		show_result

		footer
		move_down 12
		show_warning
	end

	def statement 
		text "Statement Of Marks And Grades", size: 40, style: :bold
	end
	def header_info
		data =[["Sl. No:#{@slno}", {content: "Semester/Academic Session: #{@session}", colspan: 2}], 
				["Faculty:#{@faculty}", {content: "Examination: #{@examination}", colspan: 2}], 
				["Name: #{@name}","ID: \##{@id}", "Medium: #{@medium}"]]
		
		table data, {:position => :center, :column_widths => [200,170,170],:cell_style => {border_width: 0, size: 12,font_style: :bold}}
	end

	def subject_marks
		data = [["<b>C.Code</b>","<b>Course Title</b>", "<b>CR", {content: "<b>Marks</b>", colspan: 3}, "<b>GRD</b>", "<b>G.PT</b>", "<b>NA</b>"],
				["","","","Int 16/40","Ext 24/60","Total", "","",""], 
				["AAA111", "Financial Accounting", 3, "--"," --"," --", "C", 12, 1],
				["AAA222", "Financial Accounting", 3, "--"," --"," --", "C", 12, 1],
				["AAA333", "Financial Accounting", 3, "--"," --"," --", "C", 12, 1],
				["", "", "", "", "", "", "", "", "" ],
				["", "", "", "", "", "", "", "", "" ],
				["", "", "", "", "", "", "", "", "" ], 
				["","<b>Grand Total Credit Hours/Grand Total Marks/Grand Total Grade Points</b>",15, {content: 370.to_s, colspan: 3, align: :right}, "", 96, ""],
				["","<b>CGPA</b>",6.4, {content: "<b>Average:</b> ", colspan: 3}, "<b>SGPA</b>", 96, ""]
				]
#		table data, width: 300,{:position => :center, :column_widths => [100,200,1],:cell_style => {border_width: 1}} 
	table data, {:position => :center,:cell_style => {border_width: 0,inline_format: true, size: 10}, column_widths: [80,210,30,30,30,40,45,40,35,]}
	#	table (data) do 
	#		cells.borders = []
	#	end
	end

	def show_result
	#	font("#{Prawn::DATADIR}/fonts/OldeEnglish.ttf") do
 	#	text "RESULT."
	#	end

		text "RESULT", size: 12, style: :bold
	end

	def footer
		t = Time.now
		d = Date.today
		@date = d.strftime("%B") + ", " + t.year.to_s
		
		data = [["Date: "+ @date, ""], 
				["Place: Pune",{content: "<font name='Helvetica-Bold'>Controller Of Examination, SAU</font>", align: :right}]]
		table data, {position: :left, column_widths: [120,420],cell_style: {border_width: 0, font_style: :bold, inline_format: true}}

	end

	def show_warning
		str = "<u>*** Any Alteration or overwriting is illegal and makes this statemt of Marks and Grades Invalid #{Prawn::DATADIR} ***</u>"
		text str, size: 10, style: :italic, align: :center, inline_format: true
		# text str, size: 10, style: "Times-Roman", align: :center
	
	end





















	def user_name
		text "User name is: #{@user.name}", size: 40, style: :bold
	end

	def grade_report
		text "GRADE REPORT"
	end

	def student_info
		data = [["SI.NO:","Date:"],
				["Faculty:","Academic Session/Semester:"],
				["Name:","Department:"],
				["ID No:",""]]
		table data, :position => :center, :cell_style=>{:padding => 10}
	end

	def line_items
		#move_down 20
	#	table ([[1,2],[3,4]])
		
		data = [["INTERNAL","EXTERNAL","CREDIT HOURS","TOTAL HRS","CREDIT POINTS"],
			    [33,55,3,20,4]]
		table data,:position => :center, :cell_style =>{:padding=> 10}	    
		#table data,:position => :center, :cell_style =>{:border_width => 0,:padding=> 5}
		#table data,:cell_style =>{:border_width => 0}
	end

end
