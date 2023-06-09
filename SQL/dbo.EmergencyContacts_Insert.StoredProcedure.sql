USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[EmergencyContacts_Insert]    Script Date: 3/26/2023 9:22:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Dylan McCallum
-- Create date: 24FEB23
-- Description: Insert into dbo.EmergencyContacts
-- Code Reviewer:

-- MODIFIED BY: Dylan McCallum
-- MODIFIED DATE:02MAR23
-- Code Reviewer:
-- Note: Changing UserId to CreatedBy
-- =============================================


CREATE Proc [dbo].[EmergencyContacts_Insert]
			@UserId int
			,@Name nvarchar(100)
			,@PhoneNumber nvarchar(100)
			,@Id int OUTPUT

as

/*-----------TEST CODE----------

Declare @Id int = 0

Declare @UserId int = 12
		,@Name nvarchar(100) = 'John Smith'
		,@PhoneNumber nvarchar(100) = '123-456-7890'

Execute dbo.EmergencyContacts_Insert
			@UserId
			,@Name
			,@PhoneNumber
			,@Id OUTPUT

Select @Id

Select *
from dbo.EmergencyContacts
Where Id = @Id

*/------------------------------

Begin


Insert Into dbo.EmergencyContacts
				([CreatedBy]
				,[Name]
				,[PhoneNumber])
Values		
				(@UserId
				,@Name
				,@PhoneNumber)

SET @Id = SCOPE_IDENTITY()


End
GO
