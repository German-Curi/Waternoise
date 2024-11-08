USE [waternoise]
GO
/****** Object:  UserDefinedTableType [dbo].[LocationListType]    Script Date: 05/11/2024 17:47:30 ******/
CREATE TYPE [dbo].[LocationListType] AS TABLE(
	[location] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[StatusListType]    Script Date: 05/11/2024 17:47:30 ******/
CREATE TYPE [dbo].[StatusListType] AS TABLE(
	[status] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[UsernamesListType]    Script Date: 05/11/2024 17:47:30 ******/
CREATE TYPE [dbo].[UsernamesListType] AS TABLE(
	[usernames] [varchar](50) NULL
)
GO
/****** Object:  Table [dbo].[administrators]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[administrators](
	[email] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[advisor_portfolios]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[advisor_portfolios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companies]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[business_name] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[contact_number] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_advisors]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_advisors](
	[company_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[role] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[company_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[company_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_subscriptions]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_subscriptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[type] [varchar](50) NOT NULL,
	[from_datetime] [datetime] NOT NULL,
	[to_datetime] [datetime] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[portfolio_products]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[portfolio_products](
	[portfolio_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[portfolio_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[portfolio_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDcompany] [int] NOT NULL,
	[name_product] [varchar](100) NOT NULL,
	[problemType] [varchar](50) NOT NULL,
	[technicalFeatures] [varchar](255) NOT NULL,
	[currency] [varchar](50) NOT NULL,
	[price] [decimal](18, 0) NOT NULL,
	[warrantyPeriod] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subscription_payments]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscription_payments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subscription_id] [int] NOT NULL,
	[currency] [varchar](50) NOT NULL,
	[amount] [decimal](18, 0) NOT NULL,
	[bill_code] [varchar](100) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_notifications]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_notifications](
	[user_id] [int] NOT NULL,
	[priority] [varchar](50) NOT NULL,
	[company_id] [int] NOT NULL,
	[configuration] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_requests]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [varchar](50) NOT NULL,
	[name_request] [varchar](100) NOT NULL,
	[problemType] [varchar](50) NOT NULL,
	[description] [varchar](255) NOT NULL,
	[technicalFeatures] [varchar](255) NOT NULL,
	[affected_water] [varchar](50) NOT NULL,
	[location] [varchar](100) NOT NULL,
	[currency] [varchar](50) NOT NULL,
	[min_price] [decimal](18, 0) NULL,
	[max_price] [decimal](18, 0) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[retries] [int] NOT NULL,
	[is_blocked] [bit] NOT NULL,
	[company_id] [int] NOT NULL,
	[is_admin] [bit] NOT NULL,
	[last_login] [datetime] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[updated_by] [varchar](50) NOT NULL,
	[is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[administrators] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[advisor_portfolios] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[companies] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[company_advisors] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[company_subscriptions] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[portfolio_products] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[subscription_payments] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[user_notifications] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[user_requests] ADD  DEFAULT (NULL) FOR [min_price]
GO
ALTER TABLE [dbo].[user_requests] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [retries]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_blocked]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [company_id]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_admin]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (NULL) FOR [last_login]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ((0)) FOR [is_deleted]
GO
ALTER TABLE [dbo].[advisor_portfolios]  WITH CHECK ADD  CONSTRAINT [fk_advisor_portfolios_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[advisor_portfolios] CHECK CONSTRAINT [fk_advisor_portfolios_user]
GO
ALTER TABLE [dbo].[company_advisors]  WITH CHECK ADD  CONSTRAINT [fk_company_advisor_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_advisors] CHECK CONSTRAINT [fk_company_advisor_company]
GO
ALTER TABLE [dbo].[company_advisors]  WITH CHECK ADD  CONSTRAINT [fk_company_advisor_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[company_advisors] CHECK CONSTRAINT [fk_company_advisor_user]
GO
ALTER TABLE [dbo].[company_subscriptions]  WITH CHECK ADD  CONSTRAINT [fk_company_subscriptions_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[company_subscriptions] CHECK CONSTRAINT [fk_company_subscriptions_company]
GO
ALTER TABLE [dbo].[portfolio_products]  WITH CHECK ADD  CONSTRAINT [fk_portfolio_products_portfolio] FOREIGN KEY([portfolio_id])
REFERENCES [dbo].[advisor_portfolios] ([id])
GO
ALTER TABLE [dbo].[portfolio_products] CHECK CONSTRAINT [fk_portfolio_products_portfolio]
GO
ALTER TABLE [dbo].[portfolio_products]  WITH CHECK ADD  CONSTRAINT [fk_portfolio_products_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[portfolio_products] CHECK CONSTRAINT [fk_portfolio_products_product]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [fk_products_company] FOREIGN KEY([IDcompany])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [fk_products_company]
GO
ALTER TABLE [dbo].[subscription_payments]  WITH CHECK ADD  CONSTRAINT [fk_subscription_payments_subscription] FOREIGN KEY([subscription_id])
REFERENCES [dbo].[company_subscriptions] ([id])
GO
ALTER TABLE [dbo].[subscription_payments] CHECK CONSTRAINT [fk_subscription_payments_subscription]
GO
ALTER TABLE [dbo].[user_notifications]  WITH CHECK ADD  CONSTRAINT [fk_user_notifications_company] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[user_notifications] CHECK CONSTRAINT [fk_user_notifications_company]
GO
ALTER TABLE [dbo].[user_notifications]  WITH CHECK ADD  CONSTRAINT [fk_user_notifications_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_notifications] CHECK CONSTRAINT [fk_user_notifications_user]
GO
ALTER TABLE [dbo].[user_requests]  WITH CHECK ADD  CONSTRAINT [fk_user_requests_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_requests] CHECK CONSTRAINT [fk_user_requests_user]
GO
/****** Object:  StoredProcedure [dbo].[companies_create]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[companies_create]
@user_id INT,
@business_name VARCHAR(50),
@address VARCHAR(255),
@email VARCHAR(255),
@contact_number VARCHAR(255),
@created_at DATETIME,
@updated_at DATETIME,
@updated_by VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar en la tabla 'companies'
    INSERT INTO [waternoise].[dbo].[companies]
    (
        business_name,
        address,
        contact_number,
        email,
        created_at,
        updated_at,
        updated_by
    ) VALUES (
        @business_name,
        @address,
        @contact_number,
        @email,
        @created_at,
        @updated_at,
        @updated_by
    );

    -- Obtener el ID de la compañía insertada
    DECLARE @InsertedCompanyID INT;
    SET @InsertedCompanyID = SCOPE_IDENTITY();

    -- Insertar en la tabla 'company_advisors'
    INSERT INTO [waternoise].[dbo].[company_advisors] 
    (
        company_id,
        user_id,
        role,
        created_at,
        updated_at,
        updated_by
    ) VALUES (
        @InsertedCompanyID,
        @user_id,
        'owner',
        @created_at,
        @updated_at,
        @updated_by
    );

    -- Actualizar el campo 'company_id' en la tabla 'Users'
    UPDATE [waternoise].[dbo].[Users]
    SET company_id = @InsertedCompanyID
    WHERE id = @user_id;

    -- Retornar el ID de la compañía insertada
    SELECT @InsertedCompanyID AS id;
END;
GO
/****** Object:  StoredProcedure [dbo].[companies_get_by_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[companies_get_by_id]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		c.id,
		c.business_name,
		c.address,
		c.contact_number,
		c.email,
		c.created_at,
		c.updated_at,
		c.updated_by,
		c.is_deleted
	FROM [waternoise].[dbo].[companies] AS c
	WHERE c.id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[companies_update]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[companies_update]
@id int,
@address varchar(255),
@email varchar(255),
@contact_number varchar(255),
@updated_at datetime,
@updated_by varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [waternoise].[dbo].[companies]
	SET
		email = @email,
		address = @address,
		contact_number = @contact_number,
		updated_at = @updated_at,
		updated_by = @updated_by
	WHERE id = @id;
	SELECT SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[portfolios_create]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[portfolios_create]
@user_id int,
@title varchar(50),
@description varchar(255),
@created_at datetime,
@updated_at datetime,
@updated_by varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [waternoise].[dbo].[advisor_portfolios]
	(
		user_id,
		title,
		description,
		created_at,
		updated_at,
		updated_by
	) VALUES (
		@user_id,
		@title,
		@description,
		@created_at,
		@updated_at,
		@updated_by
	);
	SELECT SCOPE_IDENTITY() as id;
END
GO
/****** Object:  StoredProcedure [dbo].[portfolios_get_by_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[portfolios_get_by_id]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		id,
		user_id,
		title,
		description,
		created_at,
		updated_at,
		updated_by,
		is_deleted
	FROM [waternoise].[dbo].[advisor_portfolios]
	WHERE id = @id;;
END
GO
/****** Object:  StoredProcedure [dbo].[portfolios_get_by_user_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[portfolios_get_by_user_id]
@user_id int,
@size int,
@offset int,
@order_by_column varchar(50),
@order_by_order varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Query NVARCHAR(MAX);
	DECLARE @OrderByStatement VARCHAR(MAX);

	SET @order_by_order = CASE
	WHEN @order_by_order = 'asc'
		THEN 'asc'
	WHEN @order_by_order = 'desc'
		THEN 'desc'
	ELSE 'desc'
	END

	SET @OrderByStatement = CASE 
	WHEN @order_by_column = 'max_price'
		THEN ' order by max_price ' + @order_by_order + ' '
	WHEN @order_by_column = 'created_at'
		THEN ' order by created_at ' + @order_by_order + ' '
	WHEN @order_by_column = 'operation_type'
		THEN ' order by operation_type ' + @order_by_order + ' '
	ELSE ' order by updated_at desc '
	END
  
	SET @Query = '
	with total_rows as (
		SELECT
			count(id) as qty
		FROM [waternoise].[dbo].[advisor_portfolios]
		WHERE user_id = @user_id' +
	')
	SELECT
		id,
		user_id,
		title,
		description,
		created_at,
		updated_at,
		updated_by,
		is_deleted,
		(select qty from total_rows) as total_rows
	FROM [waternoise].[dbo].[advisor_portfolios]
	WHERE user_id = @user_id' +
	' '
	+ @OrderByStatement + '
	OFFSET @offset ROWS
	FETCH NEXT @size ROWS ONLY;';


    -- Insert statements for procedure here
	EXECUTE sp_executesql @statement = @Query, @parameters = N'@user_id int,@size int, @offset int, @order_by_column varchar(50),
	@order_by_order varchar(50)', @user_id=@user_id,@size=@size, @offset=@offset, @order_by_column=@order_by_column, @order_by_order=@order_by_order;
END;
GO
/****** Object:  StoredProcedure [dbo].[products_create]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[products_create]
    @portfolio_id int,
    @company_id int,
    @name_product varchar(100),
    @problemType varchar(50),
    @technicalFeatures varchar(255),
    @currency varchar(50),
    @price decimal(18, 0),
    @warrantyPeriod varchar(50),
    @created_at datetime,
    @updated_at datetime,
    @updated_by varchar(50)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    BEGIN TRANSACTION
    BEGIN TRY
        INSERT INTO [waternoise].[dbo].[products]
        (
            IDcompany,
            name_product,
            problemType,
            technicalFeatures,
            currency,
            price,
            warrantyPeriod,
            created_at,
            updated_at,
            updated_by,
            is_deleted
        ) VALUES (
            @company_id,
            @name_product,
            @problemType,
            @technicalFeatures,
            @currency,
            @price,
            @warrantyPeriod,
            @created_at,
            @updated_at,
            @updated_by,
            0
        );
    
        DECLARE @InsertedProductID INT;
        SET @InsertedProductID = SCOPE_IDENTITY();
		
        INSERT INTO [waternoise].[dbo].[portfolio_products]
        (
            portfolio_id,
            product_id,
            created_at,
            updated_at,
            updated_by,
            is_deleted
        ) VALUES 
        (
            @portfolio_id,
            @InsertedProductID,
            @created_at,
            @updated_at,
            @updated_by,
            0
        );

        SELECT @InsertedProductID AS id;

        COMMIT
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[products_get_by_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[products_get_by_id]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		p.id,
		pp.portfolio_id as portfolio_id,
		IDcompany,
		name_product,
		problemType,
		technicalFeatures,
		currency,
		price,
		warrantyPeriod,
		p.created_at,
		p.updated_at,
		p.updated_by,
		p.is_deleted
	FROM waternoise.[dbo].[products] AS p
	JOIN waternoise.[dbo].[portfolio_products] as pp
			ON p.id = pp.product_id
	WHERE p.id=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[products_get_by_portfolio_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[products_get_by_portfolio_id]
@portfolio_id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Selecciona todos los productos que pertenecen al portfolio especificado
    SELECT
        p.id,
        pp.portfolio_id AS portfolio_id,
        p.IDcompany,
        p.name_product,
        p.problemType,
        p.technicalFeatures,
        p.currency,
        p.price,
        p.warrantyPeriod,
        p.created_at,
        p.updated_at,
        p.updated_by,
        p.is_deleted
    FROM [waternoise].[dbo].[products] AS p
    JOIN [waternoise].[dbo].[portfolio_products] AS pp
        ON p.id = pp.product_id
    WHERE pp.portfolio_id = @portfolio_id;
END;
GO
/****** Object:  StoredProcedure [dbo].[user_requests_create]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[user_requests_create]
    @user_id int,
    @status varchar(50),
    @name_request varchar(100),
    @problem_type varchar(50),
    @description varchar(255),
    @technical_features varchar(255),
    @affected_water varchar(50),
    @location varchar(100),
    @currency varchar(50),
    @min_price decimal(18, 0),
    @max_price decimal(18, 0),
    @created_at datetime,
    @updated_at datetime,
    @updated_by varchar(50)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO [waternoise].[dbo].[user_requests]
    (
        user_id,
        status,
        name_request,
        problemType,
        description,
        technicalFeatures,
        affected_water,
        location,
        currency,
        min_price,
        max_price,
        created_at,
        updated_at,
        updated_by,
        is_deleted
    ) VALUES (
        @user_id,
        @status,
        @name_request,
        @problem_type,
        @description,
        @technical_features,
        @affected_water,
        @location,
        @currency,
        @min_price,
        @max_price,
        @created_at,
        @updated_at,
        @updated_by,
        0 -- Assuming new entries are not deleted initially, setting is_deleted to 0
    );

    SELECT SCOPE_IDENTITY() AS id;
END
GO
/****** Object:  StoredProcedure [dbo].[user_requests_get_all]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[user_requests_get_all]
@size int,
@offset int,
@status StatusListType readonly,
@location LocationListType readonly,
@usernames UsernamesListType readonly,
@order_by_column varchar(50),
@order_by_order varchar(50),
@from_date datetime,
@to_date datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @Query NVARCHAR(MAX);
	DECLARE @FromDateFilter VARCHAR(MAX);
	DECLARE @ToDateFilter VARCHAR(MAX);
	DECLARE @StatusFilter VARCHAR(MAX);
	DECLARE @LocationFilter VARCHAR(MAX);
	DECLARE @UsernamesFilter VARCHAR(MAX);
	DECLARE @OrderByStatement VARCHAR(MAX);

	SET @FromDateFilter = CASE 
	WHEN @from_date IS NULL
		THEN ' 1 = 1 '
		ELSE ' updated_at >= @from_date '
	END

	SET @ToDateFilter = CASE 
	WHEN @to_date IS NULL
		THEN ' 1 = 1 '
		ELSE ' updated_at < @to_date '
	END

	SET @StatusFilter = CASE 
	WHEN EXISTS ( SELECT *
           FROM @status )
		THEN ' status in ( select status from @status ) '
		ELSE ' 1 = 1 '
	END

	SET @LocationFilter = CASE 
	WHEN EXISTS ( SELECT *
           FROM @location )
		THEN ' location in ( select location from @location ) '
		ELSE ' 1 = 1 '
	END

	SET @UsernamesFilter = CASE 
	WHEN EXISTS ( SELECT *
           FROM @usernames )
		THEN ' updated_by in ( select username from @usernames ) '
		ELSE ' 1 = 1 '
	END

	SET @order_by_order = CASE
	WHEN @order_by_order = 'asc'
		THEN 'asc'
	WHEN @order_by_order = 'desc'
		THEN 'desc'
	ELSE 'desc'
	END

	SET @OrderByStatement = CASE 
	WHEN @order_by_column = 'max_price'
		THEN ' order by max_price ' + @order_by_order + ' '
	WHEN @order_by_column = 'created_at'
		THEN ' order by created_at ' + @order_by_order + ' '
	WHEN @order_by_column = 'operation_type'
		THEN ' order by operation_type ' + @order_by_order + ' '
	ELSE ' order by updated_at desc '
	END
  
	SET @Query = '
	with total_rows as (
		SELECT
			count(id) as qty
		FROM [waternoise].[dbo].[user_requests]
		WHERE ' + @FromDateFilter
			+ ' AND ' + @ToDateFilter + ''
			+ ' AND ' + @StatusFilter + ''
			+ ' AND ' + @LocationFilter + ''
			+ ' AND ' + @UsernamesFilter + '' +
	')
	SELECT
		id,
        user_id,
        status,
        name_request,
        problemType,
        description,
        technicalFeatures,
        affected_water,
        location,
        currency,
        min_price,
        max_price,
        created_at,
        updated_at,
        updated_by,
        is_deleted,
		(select qty from total_rows) as total_rows
	FROM [waternoise].[dbo].[user_requests]
	WHERE ' + @FromDateFilter
			+ ' AND ' + @ToDateFilter + ''
			+ ' AND ' + @StatusFilter + ''
			+ ' AND ' + @LocationFilter + ''
			+ ' AND ' + @UsernamesFilter + '' +
	' '
	+ @OrderByStatement + '
	OFFSET @offset ROWS
	FETCH NEXT @size ROWS ONLY;';


    -- Insert statements for procedure here
	EXECUTE sp_executesql @statement = @Query, @parameters = N'@size int, @offset int, @status StatusListType readonly, @location locationListType readonly, @usernames UsernamesListType readonly, @order_by_column varchar(50),
@order_by_order varchar(50), @from_date datetime, @to_date datetime', @size=@size, @offset=@offset, @status=@status, @location=@location, @usernames=@usernames, @order_by_column=@order_by_column, @order_by_order=@order_by_order, @from_date=@from_date, @to_date=@to_date;
END;
GO
/****** Object:  StoredProcedure [dbo].[user_requests_get_by_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[user_requests_get_by_id]
    @id INT
AS
BEGIN
    -- Evita conjuntos de resultados adicionales que interfieran con SELECT.
    SET NOCOUNT ON;

    -- Selección de los campos necesarios de acuerdo a la clase Request.
    SELECT
		id,
        user_id,
        status,
        name_request,
        problemType,
        description,
        technicalFeatures,
        affected_water,
        location,
        currency,
        min_price,
        max_price,
        created_at,
        updated_at,
        updated_by,
        is_deleted
    FROM [WATERNOISE].[dbo].[user_requests]
    WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[user_requests_get_by_user_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[user_requests_get_by_user_id]
    @user_id INT,
    @size INT,
    @offset INT,
    @order_by_column VARCHAR(50),
    @order_by_order VARCHAR(50)
AS
BEGIN
    -- Evita conjuntos de resultados adicionales que interfieran con SELECT.
    SET NOCOUNT ON;
    
    DECLARE @Query NVARCHAR(MAX);
    DECLARE @OrderByStatement VARCHAR(MAX);

    -- Validación de la dirección de ordenamiento
    SET @order_by_order = CASE
        WHEN @order_by_order = 'asc' THEN 'asc'
        WHEN @order_by_order = 'desc' THEN 'desc'
        ELSE 'desc'
    END;

    -- Generación de la cláusula ORDER BY con columnas permitidas
    SET @OrderByStatement = CASE 
        WHEN @order_by_column = 'max_price' THEN ' ORDER BY max_price ' + @order_by_order + ' '
        WHEN @order_by_column = 'created_at' THEN ' ORDER BY created_at ' + @order_by_order + ' '
        ELSE ' ORDER BY updated_at DESC '
    END;

    -- Construcción de la consulta con paginación
    SET @Query = '
    WITH total_rows AS (
        SELECT COUNT(id) AS qty
        FROM [waternoise].[dbo].[user_requests]
        WHERE user_id = @user_id
    )
    SELECT
		id,
        user_id,
        status,
        name_request,
        problemType,
        description,
        technicalFeatures,
        affected_water,
        location,
        currency,
        min_price,
        max_price,
        created_at,
        updated_at,
        updated_by,
        is_deleted,
        (SELECT qty FROM total_rows) AS total_rows
    FROM [waternoise].[dbo].[user_requests]
    WHERE user_id = @user_id ' +
    @OrderByStatement + '
    OFFSET @offset ROWS
    FETCH NEXT @size ROWS ONLY;';

    -- Ejecución de la consulta dinámica
    EXECUTE sp_executesql 
        @statement = @Query, 
        @parameters = N'@user_id INT, @size INT, @offset INT, @order_by_column VARCHAR(50), @order_by_order VARCHAR(50)',
        @user_id = @user_id, 
        @size = @size, 
        @offset = @offset, 
        @order_by_column = @order_by_column, 
        @order_by_order = @order_by_order;
END;
GO
/****** Object:  StoredProcedure [dbo].[users_create]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[users_create]
@username varchar(50),
@email varchar(255),
@password varchar(50),
@retries int,
@is_blocked bit,
@company_id int,
@last_login datetime,
@created_at datetime,
@updated_at datetime,
@updated_by varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [waternoise].[dbo].[users]
	(
		username,
		email,
		password,
		retries,
		is_blocked,
		company_id,
		last_login,
		created_at,
		updated_at,
		updated_by
	) VALUES (
		@username,
		@email,
		@password,
		@retries,
		@is_blocked,
		@company_id,
		@last_login,
		@created_at,
		@updated_at,
		@updated_by
	);
	SELECT SCOPE_IDENTITY() as id;
END
GO
/****** Object:  StoredProcedure [dbo].[users_get_all]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[users_get_all]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		id,
		username,
		email,
		password,
		retries,
		is_blocked,
		company_id,
		is_admin,
		last_login,
		created_at,
		updated_at,
		updated_by,
		is_deleted
	FROM [waternoise].[dbo].[users];
END
GO
/****** Object:  StoredProcedure [dbo].[users_get_by_id]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[users_get_by_id]
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		u.id,
		u.username,
		u.email,
		u.password,
		u.retries,
		u.is_blocked,
		u.company_id,
		u.is_admin,
		u.last_login,
		u.created_at,
		u.updated_at,
		u.updated_by,
		u.is_deleted,
		case when ca.user_id is not null then ca.company_id else 0 end as company_id,
		case when a.email is not null then 1 else 0 end as is_admin
	FROM [waternoise].[dbo].[users] AS u
	LEFT JOIN [waternoise].[dbo].[company_advisors] AS ca
		on u.id = ca.user_id
	LEFT JOIN [waternoise].[dbo].[administrators] AS a
		on u.email = a.email
	WHERE u.id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[users_get_by_username]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[users_get_by_username]
@username varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		u.id,
		u.username,
		u.email,
		u.password,
		u.retries,
		u.is_blocked,
		u.company_id,
		u.is_admin,
		u.last_login,
		u.created_at,
		u.updated_at,
		u.updated_by,
		u.is_deleted,
		case when ca.user_id is not null then ca.company_id else 0 end as company_id,
		case when a.email is not null then 1 else 0 end as is_admin
	FROM [waternoise].[dbo].[users] AS u
	LEFT JOIN [waternoise].[dbo].[company_advisors] AS ca
		on u.id = ca.user_id
	LEFT JOIN [waternoise].[dbo].[administrators] AS a
		on u.email = a.email
	WHERE username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[users_update]    Script Date: 05/11/2024 17:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[users_update]
@id int,
@username varchar(50),
@email varchar(255),
@password varchar(50),
@retries int,
@is_blocked bit,
@last_login datetime,
@updated_at datetime,
@updated_by varchar(50),
@is_deleted bit
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE [waternoise].[dbo].[users]
	SET
		username = @username,
		email = @email,
		password = @password,
		retries = @retries,
		is_blocked = @is_blocked,
		last_login = @last_login,
		updated_at = @updated_at,
		updated_by = @updated_by,
		is_deleted = @is_deleted
	WHERE id = @id;
	SELECT SCOPE_IDENTITY();
END
GO
