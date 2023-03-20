CREATE TABLE DetailSalonServices
(
 TransactionId CHAR (5) NOT NULL,
 TreatmentId CHAR (5) NOT NULL,

 PRIMARY KEY (TransactionId,TreatmentId),

 FOREIGN KEY (TransactionId) REFERENCES HeaderSalonServices(TransactionId) ON UPDATE CASCADE ON DELETE CASCADE,
 FOREIGN KEY (TreatmentId) REFERENCES MsTreatment(TreatmentId) ON UPDATE CASCADE ON DELETE CASCADE

)