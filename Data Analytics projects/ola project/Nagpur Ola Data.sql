create database ola;
use ola;
Select * from nagpur_0larides_data;
#__________________________________________________________________________________________________________________________________________________________________________
#1. Retrieve all successful bookings:
create view successful_bookings As
select*from nagpur_0larides_data
where Booking_Status ="Successful";
#*****ANSWER******
select * from successful_bookings;
#__________________________________________________________________________________________________________________________________________________________________________
#2. Find the average ride distance for each vehicle type:
create view AVG_RIDE_DISTANCE as
Select Vehicle_Type, AVg(Ride_Distance)
as avg_distance from nagpur_0larides_data
group by Vehicle_Type;
#******ANSWER******
select*from AVG_RIDE_DISTANCE;
#________________________________________________________________________________________________________________________________________________________________________
#3. Get the total number of cancelled rides by customers:
Create view Ride_Cancelled_by_Customer as
select count(*)from nagpur_0larides_data
where Booking_Status="Cancelled by Customer";
#**********ANSWER**********
select * from Ride_Cancelled_by_Customer;
#________________________________________________________________________________________________________________________________________________________________________
#4. List the top 5 customers who booked the highest number of rides:
create view  top_5_customers as
Select Customer_ID, count(Booking_ID) as Total_ride
from nagpur_0larides_data
Group by Customer_ID
Order by Total_ride DEsc limit 5;
#**********Answer***********
Select * from top_5_customers;
#_______________________________________________________________________________________________________________________________________________________________________
#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from nagpur_0larides_data
where Reason_for_cancelling_by_Driver="Personal & Car related issues";
#***********ANSWER**********
select * from rides_cancelled_by_drivers;
#_______________________________________________________________________________________________________________________________________________________________________
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_and_min_ratings_Prime_Sedan As
select max(Driver_Ratings) As Max_rating,
min(Driver_Ratings) as Min_rating
from nagpur_0larides_data where Vehicle_Type="Prime Sedan";
#**********ANSWER**********
select * from max_and_min_ratings_Prime_Sedan;
#_______________________________________________________________________________________________________________________________________________________________________
#7.Find the average customer rating per vehicle type:
create view average_customer_rating as
select Vehicle_Type, avg(Customer_Rating) as Avg_customer_rating
from nagpur_0larides_data
group by Vehicle_Type;
#**********ANSWER**********
select*from average_customer_rating;
#_______________________________________________________________________________________________________________________________________________________________________
 #8.Calculate the total booking value of rides completed successfully:
CREATE view total_booking_value as
select sum(Booking_Value) as Total_successful_value
from nagpur_0larides_data
where Booking_Status="Successful";
#**********ANSWER**********
select*from total_booking_value;
#_______________________________________________________________________________________________________________________________________________________________________
#9.List all incomplete rides along with the reason:
create view incomplete_rides_with_reason as
select Booking_ID, Incomplete_Rides_Reason
from nagpur_0larides_data
where Booking_Status="Incomplete";
#**********ANSWER**********
select * from incomplete_rides_with_reason;