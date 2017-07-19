function GenderOfJob(job_index as UByte) as String

 dim result as String
 
 select case job_index
  case young_caller_job, archer_job, white_wiz_job, adult_caller_job
   result = "female"
  case else
   result = "male"
 end select
 
 return result

end function
