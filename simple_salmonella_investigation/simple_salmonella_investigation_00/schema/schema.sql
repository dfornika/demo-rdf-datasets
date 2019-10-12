CREATE TABLE IF NOT EXISTS "subject" (
  "id" INTEGER PRIMARY KEY,
  "subject_identifier" TEXT,
  "birthdate" DATE
);
CREATE TABLE IF NOT EXISTS "sample" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "isolation_source" TEXT,
  "subject_id" INTEGER,
  "collection_date" DATE,
  FOREIGN KEY (subject_id) REFERENCES subject(id)
);
CREATE TABLE IF NOT EXISTS "library" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT,
  "sample_id" INTEGER,
  "creation_date" DATE,
  "type" TEXT,
  FOREIGN KEY (sample_id) REFERENCES sample(id)
);
CREATE TABLE IF NOT EXISTS "analysis" (
  "id" INTEGER PRIMARY KEY,
  "type" TEXT
);
CREATE TABLE IF NOT EXISTS "analysis_input_file" (
  "id" INTEGER PRIMARY KEY,
  "analysis_id" INTEGER,
  "path" TEXT,
  "filename" TEXT,
  "filetype" TEXT,
  "file_format_name" TEXT,
  FOREIGN KEY (analysis_id) REFERENCES analysis(id)
);
CREATE TABLE IF NOT EXISTS "analysis_input_parameter" (
  "id" INTEGER PRIMARY KEY,
  "analysis_id" INTEGER,
  "parameter_name" TEXT,
  "parameter_flag" TEXT,
  "parameter_value" TEXT,
  FOREIGN KEY (analysis_id) REFERENCES analysis(id)
);
CREATE TABLE IF NOT EXISTS "analysis_library" (
  "id" INTEGER PRIMARY KEY,
  "analysis_id" INTEGER,
  "library_id" INTEGER,
  FOREIGN KEY (analysis_id) REFERENCES analysis(id),
  FOREIGN KEY (library_id) REFERENCES library(id)
);
CREATE TABLE IF NOT EXISTS "analysis_output_datum" (
  "id" INTEGER PRIMARY KEY,
  "analysis_id" INTEGER,
  "datum_type" TEXT,
  "datum_value" TEXT,
  FOREIGN KEY (analysis_id) REFERENCES analysis(id)
);
