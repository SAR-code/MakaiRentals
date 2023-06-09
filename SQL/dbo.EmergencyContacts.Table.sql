USE [Makai]
GO
/****** Object:  Table [dbo].[EmergencyContacts]    Script Date: 3/26/2023 9:22:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmergencyContacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_EmergencyContacts_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmergencyContacts]  WITH CHECK ADD  CONSTRAINT [FK_EmergencyContacts_Users] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EmergencyContacts] CHECK CONSTRAINT [FK_EmergencyContacts_Users]
GO
