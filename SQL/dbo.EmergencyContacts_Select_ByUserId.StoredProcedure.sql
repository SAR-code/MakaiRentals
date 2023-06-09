USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[EmergencyContacts_Select_ByUserId]    Script Date: 3/26/2023 9:22:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Dylan McCallum
-- Create date: 24FEB23
-- Description: Select By UserId into dbo.EmergencyContacts
-- Code Reviewer:Armando Padilla

-- MODIFIED BY: Dylan McCallum
-- MODIFIED DATE: 02MAR23
-- Code Reviewer:
-- Note: Changing UserId to CreatedBy
-- =============================================

CREATE Proc [dbo].[EmergencyContacts_Select_ByUserId]
				 @UserId int

as

/*-----------TEST CODE----------

Declare @UserId int = 12
Execute dbo.EmergencyContacts_Select_ByUserId @UserId

*/------------------------------

Begin

Select [Id]
	  ,[CreatedBy]
	  ,[Name]
	  ,[PhoneNumber]
From   [dbo].[EmergencyContacts]
Where  [CreatedBy] = @UserId

End
GO
