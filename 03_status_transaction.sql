CREATE TABLE PTIS.PropertyAssessmentStatusTxn (
    StatusHistoryId BIGINT IDENTITY PRIMARY KEY,
    OwnerID BIGINT NOT NULL,
    StatusCode VARCHAR(50) NOT NULL,

    StartedOn DATETIME2(3) DEFAULT SYSUTCDATETIME(),
    CompletedOn DATETIME2(3) NULL,

    PerformedBy VARCHAR(100),
    Remarks VARCHAR(500),

    SurveyorName VARCHAR(100),
    GeoSequenceNo VARCHAR(50),
    AuditScore INT,
    AssessmentAmount DECIMAL(14,2)
);
