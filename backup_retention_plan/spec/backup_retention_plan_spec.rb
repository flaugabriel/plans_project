# frozen_string_literal: true

require "backup_retention_plan"

RSpec.describe BackupRetentionPlan do
  describe '#should_retain Beginner plan' do
    context 'when using the Beginner plan' do
      it 'retains snapshot within the retention period' do
        retention_plan = BackupRetentionPlan.should_retain('Beginner', '2023/04/23')
        expect(retention_plan).to be true
      end

      it 'deletes snapshot outside the retention period' do
        retention_plan = BackupRetentionPlan.should_retain('Beginner', '2023/1/23')
        expect(retention_plan).to be false
      end
    end
  end

  describe '#should_retain Pro plan' do
    context 'when using the Pro plan' do
      it 'retains snapshot within the retention period' do
        retention_plan = BackupRetentionPlan.should_retain('Pro', '2023/05/23')

        expect(retention_plan).to be true
      end
    end

    context 'deletes snapshot outside the retention period' do
      it 'retains snapshot within the retention period can be deleted' do
        retention_plan = BackupRetentionPlan.should_retain('Pro', '2023/03/23')

        expect(retention_plan).to be false
      end

      it 'retains snapshot within the retention period can be deleted' do
        retention_plan = BackupRetentionPlan.should_retain('Pro', '2023/03/23')

        expect(retention_plan).to be false
      end
    end
  end

  describe '#should_retain Ultra plan' do
    context 'when using the Pro plan' do
      it 'retains snapshot within the retention period' do
        retention_plan = BackupRetentionPlan.should_retain('Ultra', '2023/04/23')
        expect(retention_plan).to be true
      end
      
      it 'retains snapshot within the retention period' do
        retention_plan = BackupRetentionPlan.should_retain('Ultra', '2023/05/31')

        expect(retention_plan).to be true
      end
    end

    context "deletes snapshot outside the retention period'" do
      it 'retains snapshot within the retention period can be deleted' do
        retention_plan = BackupRetentionPlan.should_retain('Ultra', '2023/05/01')

        expect(retention_plan).to be true
      end

      it 'retains snapshot within the retention period can be deleted' do
        retention_plan = BackupRetentionPlan.should_retain('Ultra', '2024/01/01')
        expect(retention_plan).to be true
      end
    end
  end
end
