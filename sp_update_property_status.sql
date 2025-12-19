CREATE PROCEDURE PTIS.sp_UpdatePropertyStatus
(
    @OwnerID BIGINT,
    @NewStatusCode VARCHAR(50),
    @UserID int,
    @Remarks VARCHAR(500) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRAN;

    DECLARE @CurrentOrder INT, @NewOrder INT;

    SELECT @CurrentOrder = sm.StatusOrder
    FROM PTIS.PropertyAssessment pa
    JOIN PTIS.AssessmentStatusMaster sm
      ON pa.CurrentStatusCode = sm.StatusCode
    WHERE pa.OwnerID = @OwnerID;

    SELECT @NewOrder = StatusOrder
    FROM PTIS.AssessmentStatusMaster
    WHERE StatusCode = @NewStatusCode;

    IF @NewOrder <> @CurrentOrder + 1
    BEGIN
        ROLLBACK;
        THROW 50001, 'Invalid status transition', 1;
    END

    UPDATE PTIS.PropertyAssessmentStatusTxn
    SET CompletedOn = SYSUTCDATETIME()
    WHERE StatusHistoryId =
        (SELECT CurrentStatusHistoryId
         FROM PTIS.PropertyAssessment
         WHERE OwnerID = @OwnerID);

    INSERT INTO PTIS.PropertyAssessmentStatusTxn
    (OwnerID, StatusCode, PerformedBy, Remarks)
    VALUES
    (@OwnerID, @NewStatusCode, @UserID, @Remarks);

    DECLARE @NewHistoryId BIGINT = SCOPE_IDENTITY();

    UPDATE PTIS.PropertyAssessment
    SET CurrentStatusCode = @NewStatusCode,
        CurrentStatusHistoryId = @NewHistoryId,
        LastUpdatedOn = SYSUTCDATETIME(),
        LastUpdatedBy = @UserID
    WHERE OwnerID = @OwnerID;

    COMMIT;
END;
