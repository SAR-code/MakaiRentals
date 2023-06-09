USE [Makai]
GO
/****** Object:  StoredProcedure [dbo].[EmergencyContacts_Delete_ById]    Script Date: 3/26/2023 9:22:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Dylan McCallum
-- Create date: 25FEB23
-- Description: Delete by Id from dbo.EmergencyContacts
-- Code Reviewer:Armando Padilla
-- =============================================

CREATE Proc [dbo].[EmergencyContacts_Delete_ById]
				  @Id int

as 

/*-----------TEST CODE----------

Declare @Id int = 14
Execute dbo.EmergencyContacts_Delete_ById @Id

*/------------------------------

Begin

Delete
From [dbo].[EmergencyContacts]
Where Id = @Id

End
GO
