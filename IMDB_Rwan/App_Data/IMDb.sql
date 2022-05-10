drop database IMDb
create database IMDb

USE IMDb

CREATE TABLE [dbo].[Users] (
    [id]       INT            NOT NULL primary key identity (1000, 1),
    [name]     NVARCHAR (255) NULL,
    [email]    NVARCHAR (255) NULL,
    [password] NVARCHAR (255) NULL,
    [image]    NVARCHAR (255) NULL,
);

CREATE TABLE [dbo].[Movies] (
    [id]          INT            NOT NULL primary key identity (1, 1),
    [name]        NVARCHAR (255) NULL,
    [description] NVARCHAR (255) NULL,
    [likes]       INT            NULL,
    [dislikes]    INT            NULL,
	[rate]    INT            NULL,
);

CREATE TABLE [dbo].[Cast] (
    [id]    INT            NOT NULL primary key identity (1, 1),
    [name]  NVARCHAR (255) NULL,
    [age]   INT            NULL,
    [image] NVARCHAR (255) NULL,
    [role]  NVARCHAR (255) NULL,
    [bio]   NVARCHAR (255) NULL,
);

go

CREATE TABLE [dbo].[Movie_images] (
    [movie_id] INT            NOT NULL,
    [image]    NVARCHAR (255) NULL,
    CONSTRAINT [FK_movie_images] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Favorite_Movies] (
    [user_id]  INT NOT NULL,
    [movie_id] INT NOT NULL,
    CONSTRAINT [FK_fav_movie_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_fav_movie_movie] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Comments] (
    [user_id]  INT            NOT NULL,
    [movie_id] INT            NOT NULL,
    [comment]  NVARCHAR (1000) NULL,
    CONSTRAINT [FK_comments_users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_comments_movies] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[likes] (
    [user_id]  INT NOT NULL,
    [movie_id] INT NOT NULL,
    [like]     BIT NULL,
    CONSTRAINT [FK_likes_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_likes_movie] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Staff] (
    [cast_id] INT NOT NULL,
    [movie_id]    INT NOT NULL,
    CONSTRAINT [FK_staff_cast] FOREIGN KEY ([cast_id]) REFERENCES [dbo].[Cast] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_staff_movie] FOREIGN KEY ([movie_id]) REFERENCES [dbo].[Movies] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Favorite_Cast] (
    [user_id]     INT NOT NULL,
    [cast_id] INT NOT NULL,
    CONSTRAINT [FK_fav_cast_user] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_fav_cast_cast] FOREIGN KEY ([cast_id]) REFERENCES [dbo].[Cast] ([id]) ON DELETE CASCADE ON UPDATE CASCADE
);
