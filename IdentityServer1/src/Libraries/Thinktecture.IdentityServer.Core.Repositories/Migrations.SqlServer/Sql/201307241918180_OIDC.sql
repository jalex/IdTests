﻿CREATE TABLE [dbo].[OpenIdConnectConfiguration] (
    [Id] [int] NOT NULL IDENTITY,
    [Enabled] [bit] NOT NULL,
    CONSTRAINT [PK_dbo.OpenIdConnectConfiguration] PRIMARY KEY ([Id])
)
CREATE TABLE [dbo].[OpenIdConnectClients] (
    [ClientId] [nvarchar](128) NOT NULL,
    [ClientSecret] [nvarchar](max) NOT NULL,
    [ClientSecretType] [int] NOT NULL,
    [Name] [nvarchar](max) NOT NULL,
    [Flow] [int] NOT NULL,
    [AllowRefreshToken] [bit] NOT NULL,
    [AccessTokenLifetime] [int] NOT NULL,
    [RefreshTokenLifetime] [int] NOT NULL,
    [RequireConsent] [bit] NOT NULL,
    CONSTRAINT [PK_dbo.OpenIdConnectClients] PRIMARY KEY ([ClientId])
)
CREATE TABLE [dbo].[OpenIdConnectClientsRedirectUris] (
    [ID] [int] NOT NULL IDENTITY,
    [RedirectUri] [nvarchar](max) NOT NULL,
    [OpenIdConnectClientEntity_ClientId] [nvarchar](128),
    CONSTRAINT [PK_dbo.OpenIdConnectClientsRedirectUris] PRIMARY KEY ([ID])
)
CREATE INDEX [IX_OpenIdConnectClientEntity_ClientId] ON [dbo].[OpenIdConnectClientsRedirectUris]([OpenIdConnectClientEntity_ClientId])
ALTER TABLE [dbo].[OpenIdConnectClientsRedirectUris] ADD CONSTRAINT [FK_dbo.OpenIdConnectClientsRedirectUris_dbo.OpenIdConnectClients_OpenIdConnectClientEntity_ClientId] FOREIGN KEY ([OpenIdConnectClientEntity_ClientId]) REFERENCES [dbo].[OpenIdConnectClients] ([ClientId])
INSERT INTO [__MigrationHistory] ([MigrationId], [Model], [ProductVersion]) VALUES ('201307241918180_OIDC', 0x1F8B0800000000000400ED5DC972DC4612BD4FC4FC43479F661C613649F9A0519076D0A428D3234A0A36651D1D60A3BA8931963616899C5F9BC37CD2FCC25461AD256B030ABD90BC9140E265D69695B5E4EBFFFDE7BF273F3D44E1E42B4AB320894FA7470787D3098A17891FC4ABD369912FBF7F3DFDE9C7BFFEE5E4AD1F3D4C7E6BE45E1139FC659C9D4EEFF37CFD6636CB16F728F2B2832858A449962CF3834512CD3C3F991D1F1EFE637674344318628AB12693939B22CE830895FFE07FCF937881D679E185D7898FC2AC7E8EDFCC4BD4C9072F42D9DA5BA0D3E9ED7D10FF91A3455EA4E8E0CA4718287F9CA31497E1E006AD932CC8933440D9C1FCCF703A390B030FDB3847E1723A59FFF0E67386E6799AC4ABF9DACB032FBC7D5C23FC7EE98519AA4BF466FD8369A10E8F49A1665E1C2739864BE25E95326D8B8B0BFCB62C0F31AB2CF4E9F45D98DC7921AEA165B02AD24A0BF501FEE49FE89179801F7D4A93354AF3C71BB4AC61AEFCE964C67E37E33F6C3FA3BE2196E0BFE2FCD5F174F2A10843EF2E446D85E11A9DE3EA46EF508CB06DC8FFE4E5394A63F26DD53282564EC73CC811F9ABD1845B0777BDE9E4327840FE7B14AFF2FB56DBB5F7D03CC17F4E279FE300F754FC519E1608B04EADF92ACB0A947E4E836DA9C66D9A7B8BFC6DE405E1E66DB8404BAF08F32FF3DBE40F1413ED5BB3E1173C58B66F4569C1FB60898867D2757C3522362A888AC821E23C4BCE93E48F00B981BB417F16418ADEC68BF4715D39AE0AEEE724099117F705BC41E1236EB54F5EE97B564196D71E6B20FCDB98089F8701762AE7F879B00C16D8DD9C15F93D71330B474A9649BA40788A48B3776952ACAF517487FFBE0FD643A1490FFF94A4F9B0562328992DCCC9AC9B529413CD97F925F251D55E4F76BAA93A92EFA63FBAEE7E44B86B033778BFA4830B7B1686C9371C5A858FB789333F51A27D09721CCDDD202F8C1C01CFB3F032497B196B3C50703FBEC69D2F0D9E7458B68AB123A77CADF320ADFA5F37353713D4B62DB9999FD575829B67E3DAE78F5184B0B2C5C66CB098366ED322CB9FEC48703A635CA32CF356688E16455AEA76024A5A9E2C9CDDC28E1E6D51D31DF2C700BF40215AF5C033EEFBDD647D8D72CFF772EF6518F4AAC88FA4F98F5F2ACF685C267186D5BA01BB415952E045CFC76FB86C9738CE73037B15ADC36011E4EE10CFB17FB34733EE8067FE32C3ED8F562FEB1F9336216BE418FFC57A6D47E0732F0A4701FEF55B3E0AEE272FCB6EEFD382052F777F06AFBD4448373B40A4053F002DE8AF93A0732E1B0B70BB99746B268CB31F6CAEF9F6BE88EED6E9368ADEED0352E1DEAE2C30E6019E4C10D9FB7AF1CAFD82AB358AAF7C5C79315ABCACD3FAD5E145E0ADE224C37E327BE23548AF69CAC5EA6DEA2D4A07304AC50AABCCEC29556933CB6EFE506BA4D9C4F0402D5BA40173AE349672F301DCED05BCF42F076DCC6CDAEF7FD71A109F50679EC1D3F25EDBE9598E16655BEAA0E23D06142E0FA8A7769179BBE2BB7570E6CF1C8A6D7C71C19C263D831314A0261EF2D4BBF072EF687BAA8FB7A7FAD5AE78ECC6FF6143BF0638DAEDE5B32F7AF8EC8BA7EAB32F826C1D7A8F5B0A75296FDBF376D57DF2ED2AFE25F5B1B3C66B64070750F4659A2DEF686D715FA95ADC75DD7EC38AE76891A2CD97BA3ACC6A9C8BB2779ACD9F636E6C5435F512B5EEEAC2C448793DCEFC6D69DED240BB417E90627FBD8D3DFBFA52DC3245D9BD9B931E02E8F2DCB4B6D0F1F96E893AF2612C81AFEAF409B92552A86D4DC0DAE26D6197C968D1B6481C270418ADB907C79364B13ECFBDA8BD378E973FF50A7E8C239DB2912B993E23A6EB24B6E3A6E7BC7374FC7A67E71D6BEDC25E0FFF32B386DF4E04433BF4B2204C27236FED4BE27E965C2C509639BC07411BE734B7A6EF35AD0FDED7A03AA890473BB8216E50580A91EC14A8BD68A7F03BFBE9659A443749A87223CC17BFCFCB10029724B1FAECD64B576474BAF27074B8F784766CC68A6287CC2F6591FC77A9F7B496866581B6B14C2A153BD8A72AEEFE857BCAE6ED2F03B1EC592D6C5344BA98650007ED7EAF03369FAB37143D5599C1EED6225AEE7D8A88F23DD459D95576197AAB2E3FFF73ECA3B43C6DA547115BBC2A69B3E9B767D7EF8F8EA693DFBCB0C0FF1E0A9521481F1FB6D2476AE95FBFDCB6A2C76249AB3229CA09C489C3CB7BEF61BFDD84C566A5166EE0D01BC6705518950F0A1F0717906CAD2669F0EFFA963659529B95B2D959B12BD25996258BA054A65B79B141166BC9DBD89FF48BB824D138B3E49B5C17611E54C57BC415717020F65C6B0B9AE04D6D01E33C5833BEE3EB97AA4B31F628B91082B86B2E86D883B9724744D1031F97BCADC5F366C6056833269DFFA98B044A0955C722D3473B00A43C8D5A078C23A40C0094A69BEA0D2D33F3401B819C3D1D9C98EC0420EB32A2744AAAB3130018CA10D28171491D00AA32ED4307DF5D4C069065B796B515400F32A81EE4977975D0D41D5600587AC355070BDCE014D121219DB954F69E682DF55283C3DDCF12B178010D1E7F7B0082146E189855A2BCE6F400CD9E3988D16EA85B753FB9518AC9C85E01BB3B61A28B997674A3B45BCA42E8F44A9787A2662C6501C05D16EA63BBFD197E79DD3B78686B42D6ACB3C1AA9A2841AD8AAD187E6380AD6560BDD0C606EDBB9359C50B563F38994908C44EAEBDF51A0F6D8A50AC7E3299576C62E7DFCFED39BBA20A63B6C800EAAED6DA5613EE61DE0A716FAB117B19A4594EEE46DD79241C3EF72341AC7F24D418200F88C4F66F4647F32DF9BBB9506ECEBB06C6559CB2AE2D2E71F54418AFAC294475252394092189F3422F05F693CE93B08862D99E94EAEB8E968CC6E89E9A235169658C39DD635B2C96374C0465DF9BA3438C60343AF4DE1A9DE3FA02F039096B0DDC563EA0819330D700F37AD11A60098B7E27F27C311D507C6D8E0D907ED1D8C06B6B6C39FF17A0492E6CAED790AA82D66EF8898D0D0ADE3056B342D05C5F47264683774FED9032182A93619DCC38B7CD4F22336116E1267C7E82329ABE9855F768F39621075AA954377B59608D3387B51707C5DEDF03473FA4868C2036F31042A7DFDA229724682264F9D81C8BE541A3E1D8373DBCA6C88606FA4B51CC5A17479006A8E12476C60394DB63A38D7C3352B752A76EE09B438D15BBC2DC6D6C240BCBD8445B526A3636E4928A59F45D967C8DE9B4EC2B8B5A821282982A8204766634349BBB234E853A5EB7529F7E163481D9870950E06E135105116B1D22951BA04514DAB780999AD045EA37E9DC2F8ADAEAA4B78D4535F24DE512773B031D3876196DCC5BF1D995AA75C3DF1A71373CC196DABA3EFD1AAD7DB5347B466D6A84B21BEDA8F182CD154DC0DB35AF6C3181840B111D10B2D5C3668A882AD8F7F635D324784055D3BCDB9971C31FF48E3680CC69024BBDBA916407B7DB434A430948A36B442D627839532013C9CBC5CC75C9C90369557229734D4A3A415A9952D0625F43C531C86C73A804ED7ACA07A0F99B2C69BEABA864CDB542F9D8B426E8FD364F79E85B782224FDD666AC833C7FECC8074576C6D553976E46F3F2468C83A54A9D833746DA0DDFBEADB097B9F3345EF46BC88368D4B23660CFBA71E95B67A335AD193DA351C39A438DD9AC721646D5C9082FBB339D40C7F2E8B22FE87519F402139071DABF4BB686E2201B245904D12F7660082ED81D7EEAC5CEF43819DFA353AF23D561E267141FEF7ACF02CF282DCF23F7AC3FA9581E5DF629B51E837EA50318A76F89FDCAB64FB9DA8770D1372517D47ADD4AE3181C05BCEE954D19C1E37BEBFB07126A46683DC8896CFE9C555A068A5491319C7ADE03ED588276DC0BED9504EDD50E793831AF613427A726602C75E9DC9C1E42EAE82E384727F002A8BE1EEEE818AE4466E2A35F583818D14F59BA2888FE9019A1C07B7374980A91C687257661C3AC2330A411BBA7B6484D66AE88D6BC3147846806695CE8FD93DB5D687259465E4DF65E41EE4FFCD5371ED70C1D1F1C3A5665733F7498FC313686922696A9F0009A23E07A28FDDA125B7EDA0BBCB6B65B79622D93B1D4029F2873AF76C7AD74D994E3791698E5B054A2752EF26FC7F12F15D50233F6CA27DBF007EEF6316A7E4126D6A91E6D32FCA2D8021998EEF1CE8C0B308F744307365296C352A9DD798D126B1F6734919150866ADB3B874716A2DBEF394F8D33BF428C820C3A2460136B4004836CD0014958677680B7D9F877BBEC493459F0E3391529B160A9B9876751028EB32FD137A4DDD6350E9A9561B4B696D2181A35ACF2EB71C2AC96A09086681F5AE288F300F5D822486A48079930A97968196C6540B4053051C8511C4EC20DC31F03D43CB4D9E4EDA8F8D84DDEEE79BFE942862C93D97F6FC1728168678C0A8C235E711D6C72F0C3DC3FA158E1F7F1AC585DC426B118267255F201449AAC35D959696AE218C3D2984C8D4A3BB13D7E50B2F85D6584A2B225201C563B3C798DD8A7050E1B5EA41D51F593F6FF96C3A6E68F61886DCA8A22343565056535970D4F2853894C27CD1E30396BCB72141D1001D2E91B6EA946E0DA8B71FC99550419A7D3E3C3C3D7D3C9591878594561644F9583FC6896657E0810E55054915AA2974DD00E9747035A82615BE2DC9631A652127FF5D2C5BD97FE2DF21EFE6E8D26FC44B90B38962EC6052E4414E31097238871880CB2C097FDC2120FA681E98F07F0BEF40703885E2AB0BBA037989CCBA53FB461DEE910050A3E96FEB01D134BFF36A228584C418CC9DD0D8949F6D6E7723F98D6BFEBB9EC693C85C950AC92BBA43F08CB58E260F88BD4248341392212533CE37160C6D3B1B7C34046F1A1992F4D38E315A41E0ED0394A0F07888A1FFFB5C0B570B03ACE8BBDED54CE7CAB409531185064C5D8E9D043C96B31149866B270EE37AD381D9E4F4F37FF69231D7FC2F3A933E9C8637F3CAB3F90F4F72FFB4342BFD139A4A4EC4F693AEC67E6EC02CFB9C369C808FA032B5807FA83CAF905FA632A6904062C31546C01FD57C63A460007E1A2FCA7DB07C19AEFDE0DF971F741A092ECFFF14265A304F9E7E39E7AFE3CE24BD559549D5982F79E579C3C27DC797DEA52A5F7B626F99FBD1E76C460E1A90D8F2CA86BF9F680E6C34592A7FCD2ACF55E25B5D9B9B9161D30E5AA1284F7B651DD35A88380DA619F10CE39B990D9E8F7ECD934E3210787CC56BC934893CB2BDE99CD5EC0622AA1D825DCB15BB85763FA0E75D6ED267E877BC7BD0793C3EBC401C8C7BED92E0490BBDBDFB3C199BABBBA9AEDF2749D813599190E00A1FCDCDE3E7EBCE51294C7FA12260C0DBFA59DD57789E6B0B7023F133E080FC8D919789BC1D5BEBC2CE17520E2881BFD926CD0BD1DA5556AA9BB09C01F32811A2F178D62D32ABBD401D2D0B880CA2EAD407CDC76D5DEFC183B94D2844BB34E2ABF80ADEBAA32B73A9D5C7B0FEF51BCCAEF4FA747C7AFC7F5B0D688439BD7DD4447FBAC3E96B875F4502EE690052D947939048FCDB61C79DB5F9D6CB2B7AB319B50C30850EA8A7EEFE31D869C76C9320AF776AA6E73135DB413959E3860C1DB6426BAB0A8C94FDCC100BF4954B49ABDA17DA32E7F7020942C2D510E3BFEC2433634A9BC2DAD9390E7A59BFC607A63B4FA27E0B1C329C23CA856308FA7D3C3830381B750AD0DA827994A4694D5FB9DA014B72A4A8977286F4993BC8E404CFBFC9406F122587BA1B636B82FADA23DD29CAD26FECD05C23A891B33AB22133B4CE60DD1C2D610CE53EB2A92492614A7913683905A24B13F1FCF77963A45B571AE408EDDA41B1C756F01A5AA3C423C84EFC8DE7F35D44041A1BFB226C8134F444314B290390A718D51D22C00D126B92864925C5A5B4DC0F571A8862031B87220498D15BA5BBEA241DA2F20DBB41F69CC842ED38AA681529039A0A0C604E53D4BD116B5386494FA0B8D75B21B56A2615249C826A9B0AEBDE417978066530883ADA790D7D825BD15245A2517856C924B6B2C02EED588B640429015909CAE46A81C02B10EA89760A9A53FA529E8E1EE2388BA7801481F2FA3D1299C638A5A451148AF2865D4AAD29654B59E1EBBDD0706E0BB77A086EEB5D500664258CDF86564F5C3B76697EB610F13DF9A18C57C606A194B0BA2F3C2D4CA1FF0BCF45BD0DBD2029C2A9682C26E3533A13ED6B599621D64BA126A6B45292584D4E6EB1EB50205B90DCFE4012C21DB00BC7D7732ABDAAA7E80FF15A83A70D85FC464D95BFD7781B260D5419CD4E6D1017F2B73152F93664DC259D488704BE526823A235EDE5BE4F835D92E2DAF7DFEE6850559EE4777C8BF8A3F16F9BAC8719151741732554ED62F2AFD2733C1E6938FE53168E6A208D8CC80EC147C8C7F2E82D06FEDBE04364D2510C495D53B5CA42D0911015A3DB6481F92D810A8AEBE763D778B70C843A6CE8FF1DCFB8AE4B6E9EB90ADB1131223A45E94D518DDF7F85FDCFDFCE8E1C7FF03303B4949ACD90000, '5.0.0.net45')