select * from Users
ALTER TABLE Users
ADD Username VARCHAR(50),
    Password VARCHAR(50);


update Users set Password='nadir2' where fname='nadir2';
update Users set Password='nadir3' where fname='nadir3';


update Users set Username='nadir3' where fname='nadir3';
update Users set Username='nadir4' where fname='nadir4';
update Users set Username='nadir5' where fname='nadir5';
update Users set Username='nadir6' where fname='nadir6';

CREATE PROCEDURE Selectnamepwd @Username varchar(20),@Password varchar(20)
AS BEGIN
SELECT * FROM Users WHERE Username = @Username AND Password = @Password
END

EXEC Selectnamepwd @Username='nadir2',@Password='nadir2'


