--Answers to Hospital DB

--Q1
select distinct p.Name from
Undergoes U left join Trained_In T on u.Physician=t.Physician and t.Treatment=u.or_procedure left join Physician p on 
u.Physician=p.EmployeeID
where t.CertificationDate is null

--Q2
select distinct p.Name from
Undergoes U left join Trained_In T on u.Physician=t.Physician and t.Treatment=u.or_procedure left join Physician p on 
u.Physician=p.EmployeeID
where u.DateUndergoes>t.CertificationExpires

--Q3
select p.name as 'patient_name', py.name  as 'physician_name', n.name  as 'nurse_name', a.Start_time as 'start_time',
a.end_time as 'end_time', a.ExaminationRoom as 'room',primary_py.name as 'prime_physician'
from Appointment a join Patient p on   a.Patient = p.SSN join Physician py 
on   a.Physician = py.EmployeeID left outer join nurse n on   a.PrepNurse = n.EmployeeID JOIN Physician primary_py
on   primary_py.EmployeeID = p.PCP
where a.Physician <> p.PCP

--Q4
select u.Stay as 'stay',u.Patient as 'patient id from undergoes', s.Patient as 'patient id from stay'
from Undergoes u join Stay s on u.Stay=s.StayID where u.Patient <>s.Patient

--Q5
select distinct n.Name from On_Call o join Room r on o.BlockFloor=r.BlockFloor and o.BlockCode=r.BlockCode join Nurse n on o.Nurse=n.EmployeeID
where r.RoomNumber=123

--Q6
select distinct ExaminationRoom,count(AppointmentID) as 'number' from Appointment group by ExaminationRoom

--Q7
select pa.Name from Prescribes p join Patient pa on p.Patient=pa.SSN where p.Physician=pa.PCP

--Q8
select distinct p.name from Patient p join Undergoes u  on   p.SSN = u.Patient join or_procedure o 
on   u.or_procedure = o.Code where o.Cost>5000 

--Q9
select p.Name, count(a.AppointmentID) as 'num of appointments' from Appointment a join Patient p on a.Patient=p.SSN 
group by p.Name having count(a.AppointmentID)>=2

--Q10
select p.Name from Department d right join Patient p on d.Head=p.PCP