CREATE TABLE PTIS.AssessmentStatusMaster (
    StatusCode VARCHAR(50) PRIMARY KEY,
    StatusOrder INT NOT NULL,
    IsFinal BIT NOT NULL DEFAULT 0
);

INSERT INTO PTIS.AssessmentStatusMaster VALUES
('Register Property', 1, 0),
('Geo-Sequencing', 2, 0),
('Survey', 3, 0),
('Data Processing', 4, 0),
('Quality Audit', 5, 0),
('Assessment Completed', 6, 1);
