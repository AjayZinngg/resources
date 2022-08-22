CREATE TABLE Group
(
  group_id varchar(300) NOT NULL,
  members text NOT NULL
);

ALTER TABLE Group ADD CONSTRAINT group_id
  PRIMARY KEY (group_id);

CREATE TABLE Ledger
(
  ledger_id varchar(300) NOT NULL,
  payer varchar(300) NOT NULL,
  payee varchar(300) NOT NULL,
  total_amount decimal(2,0) NOT NULL,
  relative_amount decimal(2,0) NOT NULL
);

ALTER TABLE Ledger ADD CONSTRAINT ledger_id
  PRIMARY KEY (ledger_id);

CREATE TABLE Transaction
(
  transaction_id varchar(300) NOT NULL,
  ledger_id varchar(300) NOT NULL,
  amount decimal(2,0) NOT NULL,
  timestamp timestamp(6) with time zone NOT NULL
);

ALTER TABLE Transaction ADD CONSTRAINT transaction_id
  PRIMARY KEY (transaction_id);

CREATE TABLE User
(
  name varchar(200) NOT NULL,
  email varchar(300) NOT NULL,
  contact bigint NOT NULL,
  user_id varchar(300) NOT NULL
);

ALTER TABLE User ADD CONSTRAINT user_id
  PRIMARY KEY (user_id);

ALTER TABLE Ledger ADD CONSTRAINT FK_Payee_
  FOREIGN KEY (payee) REFERENCES User (user_id);

ALTER TABLE Ledger ADD CONSTRAINT FK_Payer_
  FOREIGN KEY (payer) REFERENCES User (user_id);

ALTER TABLE Transaction ADD CONSTRAINT FK_Transaction_
  FOREIGN KEY (ledger_id) REFERENCES Ledger (ledger_id);

