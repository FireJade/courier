/*
 * Copyright 2015 Coursera Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.coursera.courier.android.test;

import com.google.gson.Gson;
import org.coursera.records.immutable.Simple;
import org.junit.Assert;
import org.junit.Test;

public class TestImmutableRecords {
  @Test
  public void testSimple() {
    Gson gson = new Gson();

    String json = "{ \"message\": \"simple message\"}";

    Simple deserialized = gson.fromJson(json, Simple.class);

    Assert.assertEquals(deserialized.message, "simple message");

    Simple roundTripped = gson.fromJson(gson.toJson(deserialized), Simple.class);

    Assert.assertEquals(roundTripped.message, "simple message");

  }
}