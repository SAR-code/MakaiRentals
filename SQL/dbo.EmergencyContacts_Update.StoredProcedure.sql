USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[EmergencyContacts_Update]    Script Date: 3/26/2023 9:22:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Dylan McCallum
-- Create date: 24FEB23
-- Description: Update into dbo.EmergencyContacts
-- Code Reviewer:Armando Padilla

-- MODIFIED BY: Dylan McCallum
-- MODIFIED DATE: 02MAR23
-- Code Reviewer:
-- Note: Changing UserId to CreatedBy
-- =============================================


CREATE Proc [dbo].[EmergencyContacts_Update]
			@UserId int
			,@Name nvarchar(100)
			,@PhoneNumber nvarchar(100)
			,@Id int
			
as

/*-----------TEST CODE----------

Declare @Id int = 27

Declare @UserId int = 12
		,@Name nvarchar(100) = 'Jacob Smith'
		,@PhoneNumber nvarchar(100) = '123-456-7890'

Select *
From dbo.EmergencyContacts
Where Id = @Id

Execute dbo.EmergencyContacts_Update
			@UserId
			,@Name
			,@PhoneNumber
			,@Id

Select *
from dbo.EmergencyContacts
Where Id = @Id

*/------------------------------

Begin


Update [dbo].[EmergencyContacts]
   Set [CreatedBy] = @UserId
	  ,[Name] = @Name
	  ,[PhoneNumber] = @PhoneNumber
Where  Id = @Id


End
GO
