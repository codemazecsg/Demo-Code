namespace Azure_Blob_ADLS_API
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblStorageAccountName = new System.Windows.Forms.Label();
            this.txtStorageAccountName = new System.Windows.Forms.TextBox();
            this.txtStorageKey = new System.Windows.Forms.TextBox();
            this.lblKey = new System.Windows.Forms.Label();
            this.ofdLoadFile = new System.Windows.Forms.OpenFileDialog();
            this.txtFilePath = new System.Windows.Forms.TextBox();
            this.lblFilePath = new System.Windows.Forms.Label();
            this.btnSelectFile = new System.Windows.Forms.Button();
            this.btnBlockBlobPut = new System.Windows.Forms.Button();
            this.lblStorageAccountContainer = new System.Windows.Forms.Label();
            this.txtStorageAccountContainer = new System.Windows.Forms.TextBox();
            this.btnReadADLSFile = new System.Windows.Forms.Button();
            this.txtADLSPath = new System.Windows.Forms.TextBox();
            this.lblADLSPath = new System.Windows.Forms.Label();
            this.sfdFileName = new System.Windows.Forms.SaveFileDialog();
            this.SuspendLayout();
            // 
            // lblStorageAccountName
            // 
            this.lblStorageAccountName.AutoSize = true;
            this.lblStorageAccountName.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStorageAccountName.Location = new System.Drawing.Point(12, 9);
            this.lblStorageAccountName.Name = "lblStorageAccountName";
            this.lblStorageAccountName.Size = new System.Drawing.Size(127, 13);
            this.lblStorageAccountName.TabIndex = 0;
            this.lblStorageAccountName.Text = "Storage Account Name:";
            // 
            // txtStorageAccountName
            // 
            this.txtStorageAccountName.Location = new System.Drawing.Point(15, 25);
            this.txtStorageAccountName.Name = "txtStorageAccountName";
            this.txtStorageAccountName.Size = new System.Drawing.Size(527, 22);
            this.txtStorageAccountName.TabIndex = 1;
            // 
            // txtStorageKey
            // 
            this.txtStorageKey.Location = new System.Drawing.Point(15, 125);
            this.txtStorageKey.Name = "txtStorageKey";
            this.txtStorageKey.Size = new System.Drawing.Size(527, 22);
            this.txtStorageKey.TabIndex = 3;
            // 
            // lblKey
            // 
            this.lblKey.AutoSize = true;
            this.lblKey.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblKey.Location = new System.Drawing.Point(12, 109);
            this.lblKey.Name = "lblKey";
            this.lblKey.Size = new System.Drawing.Size(154, 13);
            this.lblKey.TabIndex = 3;
            this.lblKey.Text = "Storage Account Shared Key:";
            // 
            // txtFilePath
            // 
            this.txtFilePath.Location = new System.Drawing.Point(15, 173);
            this.txtFilePath.Name = "txtFilePath";
            this.txtFilePath.Size = new System.Drawing.Size(527, 22);
            this.txtFilePath.TabIndex = 4;
            this.txtFilePath.TextChanged += new System.EventHandler(this.TxtFilePath_TextChanged);
            // 
            // lblFilePath
            // 
            this.lblFilePath.AutoSize = true;
            this.lblFilePath.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFilePath.Location = new System.Drawing.Point(12, 157);
            this.lblFilePath.Name = "lblFilePath";
            this.lblFilePath.Size = new System.Drawing.Size(54, 13);
            this.lblFilePath.TabIndex = 5;
            this.lblFilePath.Text = "File Path:";
            // 
            // btnSelectFile
            // 
            this.btnSelectFile.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSelectFile.Location = new System.Drawing.Point(467, 199);
            this.btnSelectFile.Name = "btnSelectFile";
            this.btnSelectFile.Size = new System.Drawing.Size(75, 23);
            this.btnSelectFile.TabIndex = 5;
            this.btnSelectFile.Text = "Select File";
            this.btnSelectFile.UseVisualStyleBackColor = true;
            this.btnSelectFile.Click += new System.EventHandler(this.btnSelectFile_Click);
            // 
            // btnBlockBlobPut
            // 
            this.btnBlockBlobPut.Enabled = false;
            this.btnBlockBlobPut.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBlockBlobPut.Location = new System.Drawing.Point(278, 271);
            this.btnBlockBlobPut.Name = "btnBlockBlobPut";
            this.btnBlockBlobPut.Size = new System.Drawing.Size(125, 23);
            this.btnBlockBlobPut.TabIndex = 7;
            this.btnBlockBlobPut.Text = "Block Blob Put";
            this.btnBlockBlobPut.UseVisualStyleBackColor = true;
            this.btnBlockBlobPut.Click += new System.EventHandler(this.BtnBlockBlobPut_Click);
            // 
            // lblStorageAccountContainer
            // 
            this.lblStorageAccountContainer.AutoSize = true;
            this.lblStorageAccountContainer.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStorageAccountContainer.Location = new System.Drawing.Point(12, 58);
            this.lblStorageAccountContainer.Name = "lblStorageAccountContainer";
            this.lblStorageAccountContainer.Size = new System.Drawing.Size(149, 13);
            this.lblStorageAccountContainer.TabIndex = 8;
            this.lblStorageAccountContainer.Text = "Storage Account Container:";
            // 
            // txtStorageAccountContainer
            // 
            this.txtStorageAccountContainer.Location = new System.Drawing.Point(15, 74);
            this.txtStorageAccountContainer.Name = "txtStorageAccountContainer";
            this.txtStorageAccountContainer.Size = new System.Drawing.Size(527, 22);
            this.txtStorageAccountContainer.TabIndex = 2;
            // 
            // btnReadADLSFile
            // 
            this.btnReadADLSFile.Enabled = false;
            this.btnReadADLSFile.Location = new System.Drawing.Point(420, 271);
            this.btnReadADLSFile.Name = "btnReadADLSFile";
            this.btnReadADLSFile.Size = new System.Drawing.Size(122, 23);
            this.btnReadADLSFile.TabIndex = 8;
            this.btnReadADLSFile.Text = "ADLS API Read";
            this.btnReadADLSFile.UseVisualStyleBackColor = true;
            this.btnReadADLSFile.Click += new System.EventHandler(this.BtnReadADLSFile_Click);
            // 
            // txtADLSPath
            // 
            this.txtADLSPath.Location = new System.Drawing.Point(15, 233);
            this.txtADLSPath.Name = "txtADLSPath";
            this.txtADLSPath.Size = new System.Drawing.Size(527, 22);
            this.txtADLSPath.TabIndex = 6;
            this.txtADLSPath.TextChanged += new System.EventHandler(this.TxtADLSPath_TextChanged);
            // 
            // lblADLSPath
            // 
            this.lblADLSPath.AutoSize = true;
            this.lblADLSPath.Location = new System.Drawing.Point(12, 217);
            this.lblADLSPath.Name = "lblADLSPath";
            this.lblADLSPath.Size = new System.Drawing.Size(59, 13);
            this.lblADLSPath.TabIndex = 11;
            this.lblADLSPath.Text = "ADLS Path";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(549, 306);
            this.Controls.Add(this.lblADLSPath);
            this.Controls.Add(this.txtADLSPath);
            this.Controls.Add(this.btnReadADLSFile);
            this.Controls.Add(this.txtStorageAccountContainer);
            this.Controls.Add(this.lblStorageAccountContainer);
            this.Controls.Add(this.btnBlockBlobPut);
            this.Controls.Add(this.btnSelectFile);
            this.Controls.Add(this.lblFilePath);
            this.Controls.Add(this.txtFilePath);
            this.Controls.Add(this.lblKey);
            this.Controls.Add(this.txtStorageKey);
            this.Controls.Add(this.txtStorageAccountName);
            this.Controls.Add(this.lblStorageAccountName);
            this.Font = new System.Drawing.Font("Segoe UI", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Margin = new System.Windows.Forms.Padding(2);
            this.Name = "Form1";
            this.Text = "Blob / ADLS API";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblStorageAccountName;
        private System.Windows.Forms.TextBox txtStorageAccountName;
        private System.Windows.Forms.TextBox txtStorageKey;
        private System.Windows.Forms.Label lblKey;
        private System.Windows.Forms.OpenFileDialog ofdLoadFile;
        private System.Windows.Forms.TextBox txtFilePath;
        private System.Windows.Forms.Label lblFilePath;
        private System.Windows.Forms.Button btnSelectFile;
        private System.Windows.Forms.Button btnBlockBlobPut;
        private System.Windows.Forms.Label lblStorageAccountContainer;
        private System.Windows.Forms.TextBox txtStorageAccountContainer;
        private System.Windows.Forms.Button btnReadADLSFile;
        private System.Windows.Forms.TextBox txtADLSPath;
        private System.Windows.Forms.Label lblADLSPath;
        private System.Windows.Forms.SaveFileDialog sfdFileName;
    }
}

