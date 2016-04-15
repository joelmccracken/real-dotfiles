#!/usr/bin/env bash
set -e

bin/m test/unit/clever/sync/school_test.rb
bin/m test/unit/clever/sync/section_test.rb
bin/m test/unit/clever/sync/student_test.rb
bin/m test/unit/clever/sync/teacher_test.rb
bin/m test/unit/clever/synchronizer_test.rb
bin/m test/unit/clever/updater_test.rb
bin/m test/unit/clever_event_processor_test.rb
bin/m test/unit/clever_results_query_test.rb
bin/m test/unit/clever_slever_test.rb
bin/m test/unit/clever_utils_test.rb
bin/m test/fast/clever_event_collection_test.rb
bin/m test/unit/clever/big_batch_updater_test.rb
bin/m test/integration/clever_automatic_sync_integration_test.rb
bin/m test/integration/clever_status_integration_test.rb
bin/m test/integration/clever_student_moves_integration_test.rb
bin/m test/integration/clever_synchronizer_integration_test.rb
bin/m test/end_to_end/clever_fixture.rb
bin/m test/end_to_end/clever_test.rb