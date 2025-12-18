CREATE TABLE PTIS.PropertyAssessment (
    PropertyAssessmentId BIGINT IDENTITY(1,1) PRIMARY KEY,
    OwnerID BIGINT NOT NULL UNIQUE,

    CurrentStatusCode VARCHAR(50) NOT NULL,
    CurrentStatusHistoryId BIGINT NOT NULL,

    CreatedOn DATETIME2(3) DEFAULT SYSUTCDATETIME(),
    CreatedBy VARCHAR(100),

    LastUpdatedOn DATETIME2(3) DEFAULT SYSUTCDATETIME(),
    LastUpdatedBy VARCHAR(100)
);