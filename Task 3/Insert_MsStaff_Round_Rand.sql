
---3 Insert MsStaff with Round & Rand

INSERT INTO 
	MsStaff (Staffid,StaffName,StaffGender,StaffPhone,StaffAddress,StaffSalary,StaffPosition)

VALUES
	(
	'SF010',
	'Effendy Lesmana',
	'Male',
	'085218587878',
	'Tanggerang City Street no 88',
	ROUND(RAND()*(5000000 - 3000000) + 3000000 ,0),
	'Stylist'
	)
	
