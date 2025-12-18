CREATE PROCEDURE PTIS.sp_RegisterProperty
(
    @OwnerID BIGINT,
    @UserName VARCHAR(100)
)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO PTIS.PropertyAssessmentStatusTxn
    (OwnerID, StatusCode, PerformedBy)
    VALUES
    (@OwnerID, 'Register Property', @UserName);

    DECLARE @HistoryId BIGINT = SCOPE_IDENTITY();

    INSERT INTO PTIS.PropertyAssessment
    (OwnerID, CurrentStatusCode, CurrentStatusHistoryId, CreatedBy)
    VALUES
    (@OwnerID, 'Register Property', @HistoryId, @UserName);
END;
